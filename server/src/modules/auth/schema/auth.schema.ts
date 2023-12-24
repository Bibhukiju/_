import { z } from "zod";

export const authSchema = z.object({
  body: z.object({
    name: z.string({
      required_error: "username is missing",
    }),
    email: z
      .string({ required_error: "email is required" })
      .email("not valid email"),
    image: z.string({ required_error: "image is required" }),
  }),
});
