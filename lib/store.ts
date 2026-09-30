import {createClient, type Client, type InValue} from '@libsql/client';
let client:Client|undefined;
function getClient(){
 if(!process.env.TURSO_DATABASE_URL||!process.env.TURSO_AUTH_TOKEN)throw new Error('Connect the Turso database in Vercel, then redeploy.');
 return client??=createClient({url:process.env.TURSO_DATABASE_URL,authToken:process.env.TURSO_AUTH_TOKEN});
}
function values(args:unknown[]):InValue[]{return args.map(x=>x===undefined?null:x) as InValue[];}
function rowData(row:Record<string,unknown>){return Object.fromEntries(Object.entries(row).map(([k,v])=>[k,typeof v==='bigint'?Number(v):v]));}
class Statement{
 constructor(readonly sql:string,readonly args:InValue[]=[]){ }
 bind(...args:unknown[]){return new Statement(this.sql,values(args));}
 async first<T=Record<string,unknown>>():Promise<T|null>{const result=await getClient().execute({sql:this.sql,args:this.args});return result.rows[0]?rowData(result.rows[0]) as T:null;}
 async all(){const result=await getClient().execute({sql:this.sql,args:this.args});return {results:result.rows.map(rowData)};}
 async run(){const result=await getClient().execute({sql:this.sql,args:this.args});return {meta:{changes:result.rowsAffected}};}
}
export function database(){return {
 prepare:(sql:string)=>new Statement(sql),
 batch:async(statements:Statement[])=>getClient().batch(statements.map(s=>({sql:s.sql,args:s.args})),'write'),
};}
