import { Router } from "express";
import { signIn } from "../controller/auth.controller";


const authRouter = Router();

authRouter.post("/auth", signIn);

export default authRouter;
