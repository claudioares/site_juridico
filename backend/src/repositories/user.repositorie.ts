import { prisma } from "../database/prisma.config";
import { ICreateUser, IUserMethods } from "../interfaces/user.interface";

export class UserRepositorie implements IUserMethods {
    async create(_name: string, _email: string, _password: string): Promise<ICreateUser> {
        const userRepositorie = await prisma.user.create({
            data: {
                name: _name,
                email: _email,
                password: _password
            }
        })

        return userRepositorie;
    }
} 