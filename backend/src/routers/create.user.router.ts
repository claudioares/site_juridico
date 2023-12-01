import e, { Router } from "express";
import { UserUserCase } from "../usecases/user.usecase";

export const createUserRouter =  Router();

type RequestBody = {
    name: string,
    email: string,
    password: string
}

createUserRouter.post("/user", async (req, res)=>{

    const {name, email, password}:RequestBody = req.body as RequestBody;

    try {
        const useUseCase = new UserUserCase();
        const result = await useUseCase.create(name, email, password)


        return res.status(201).json({
            messege: {result}
        })
        
    } catch (error) {
        console.error('Error during authentication:', error);
        res.status(500).json({ error: "Error during creation!" });
    }
});
