import { Request, Response } from "express";
import { zParse } from "../../../core/utils/validator";
import { authSchema } from "../schema/auth.schema";
import { signInService } from "../services/auth.service";

export const signIn = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    await zParse(authSchema, req);
    const isSignedIn = await signInService(req.body);
    if (isSignedIn) {
      return res.status(500).send({ msg: "Internal server issue" });
    }
    return res.send({ msg: "Account created" });
  } catch (error) {
    console.log(error);
    res.status(400).send({ msg: "fail" });
  }
};
