import mongoose from "mongoose";

export const connectdb = async ()=>{
    try {
       const conn =  await mongoose.connect("mongodb+srv://Xeefow123:123@cluster0.cgo66kf.mongodb.net/real?retryWrites=true&w=majority&appName=Cluster0");
        console.log(`database connected successfully to ${conn.connection.name} db`);
    } catch (error) {
        console.log("database connection fieled", error)
        
    }

}