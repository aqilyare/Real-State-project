import express from "express"
import { connectdb } from "./config/db.js";
import userRoutes from "./routes/userRoutes.js";



connectdb();

const app = express();

app.use(express.json());

app.get("", (res, req)=>{
    console.log("Welcome to real estate server")
})



app.use("/api", userRoutes);
app.listen(5000, ()=>{
    console.log("server is running on port 5000");
})