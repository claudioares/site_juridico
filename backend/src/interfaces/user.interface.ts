export interface IUsers{
    id: string,
    name: string,
    email: string,
    whats: string,
    password: string,
    workRequest: [],
    status: boolean,
}

export interface ICreateUser {
    id: string,
    name: string,
    email: string,
    password: string,
}
export interface IUserMethods {
    create(_name:string, _email: string, _password: string):Promise<ICreateUser>
}