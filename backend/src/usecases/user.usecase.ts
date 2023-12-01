import { UserRepositorie } from "../repositories/user.repositorie";
import bcrypt from 'bcrypt'

export class UserUserCase {

    private userRepositorie : UserRepositorie

    constructor(){
        this.userRepositorie = new UserRepositorie();
    };


    async create (name:string, email:string, password:string) {
        if(!name || !email || !password) {throw new Error ("All Necessary Requests")}

        const hashPassword = await bcrypt.hash(password, 10);

        const responseUserCase = await this.userRepositorie.create(name, email, hashPassword);

        const {password:_, ...user} = responseUserCase;

        return user;
    }
}