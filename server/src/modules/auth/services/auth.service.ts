import { User } from "../entity/auth.entity";
import { myDataSource } from "../../../config/database.config";

const userRepo = myDataSource.getRepository(User);

export const signInService = async ({
  name,
  email,
  image,
}: {
  name: string;
  email: string;
  image: string;
}): Promise<User | Error> => {
  try {
    await userRepo.save(userRepo.create({ name, email, image_address: image }));
    const user: User = await getUserByEmail(email);
    console.log(user);
  } catch (error) {
    return Error("");
  }
};

const getUserByEmail = async (email: string): Promise<User> => {
  const user = await userRepo.find({ where: { email } });
  console.log(user[0]);
  return user[0];
};

export const getuserByEmail = async ({}) => {};
