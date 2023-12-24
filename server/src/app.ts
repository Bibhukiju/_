import * as express from "express";
import { myDataSource } from "./config/database.config";
import authRouter from "./modules/auth/routes/auth.routes";

const app = express();
const PORT = 3000;

// ? establish db Connection
myDataSource
  .initialize()
  .then(() => {
    console.log("Data Source has been initialized!");
  })
  .catch((err) => {
    console.error("Error during Data Source initialization:", err);
  });

// ? middlewaare
app.use(express.json());
app.use(authRouter);

app.listen(PORT, () => {
  console.log("hello I am runnig at 3000");
});
