import express from "express";
import { createUserRouter } from "./routers/create.user.router";



export const app = express();

app.use(express.json());
app.use(createUserRouter)