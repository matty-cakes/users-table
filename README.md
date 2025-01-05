# Users Table 🤷

> Gosh I don't want to create another `users` table 😖

## What is this?

The `users-table` project aims to be a simple boilerplate tool capable of getting you up and running with __just enough__ boilerplate annoyance removed that you can have fun, but not so much that you can't see what's happening ⚖️

## Why make this?

I wanted to play with YAWF (yet another web framework) and I really didn't feel like creating another users table to play with it so... here it is and now I hopefully never have to think of it again.

## How do I use it?

- You likely don't 😊
- You'll love how high tech this is tech bros!
- Copy the Makefile and update the `APP` and `PGPASSWORD` vars in the Makefile so the database is unique and secure. Or just supply them at run time (`make setup APP=x PGPASSWORD=y`).__Warning__: if you forget to pass `APP=x` it will default to `app` so your Docker volumes CAN get confusing.
- Run `make setup`
- When you are done with it clean up using `make clean`
- Yay! You did it you made a users-table without having to remember SQL `CREATE` syntax. Go you 🥳
