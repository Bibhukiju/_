import { DataSource } from "typeorm"

export const myDataSource = new DataSource({
    type: "postgres",
    host: "0.0.0.0",
    port: 5432,
    username: "postgres",
    password: "postgres",
    database: "blog_app",
    entities: ["src/modules/*/entity/*.entity.ts"],
    logging: true,
    synchronize: true,
})