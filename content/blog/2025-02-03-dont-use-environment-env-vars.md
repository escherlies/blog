+++
title = "Stop using stinky `if (env === \"development\") ...` control flow checks"
date = 2025-02-03
tags = []
+++


Do not use an environment control flow check like `development`, `production` or `testing` in your codebase.

Instead, whenever you want you app to behave differently in some context, use explicit env vars, making sure your app behaves as intendet.

## Example

### 🚫 Bad example

```ts
// 🚫 DON'T
if (process.env.NODE_ENV === "development") {
  // Do something really stupid in development like
  // - Alternate upload dir in development
  // - Not wanting to actually send emails
  // - Printing extra debugging information
}
```

### ✅ The almost correct way to do it

```ts
// ✅ DO
// Check explicit env vars
// - Upload dir in development
saveFile(process.env.UPLOAD_DIR, file)

// - Not sending actual emails
if (not(process.env.SEND_EMAILS)) {
  return logger.debug("Preview email:", email)
}

// - Printing extra debugging information
const logger = new Logger({logLevel: process.env.LOG_LEVEL})
logger.debug(/*...*/)
```

*Almost? Yes, because:

# Type-safe env vars

Also, create a config where you export the fucking env var as a constant, wrapped in a little helper to check if the env var is set and then either throw an error or set a default value, so you have type-safe enviroment vars!

```ts
const getEnvVar = (var: string, parser: ZodTypeAny) => { /* ... */ }
// Get and parse an env var with a  default if not set. Printing a waring when unset is advised.
export const SEND_MAILS = getEnvVar("SEND_MAILS", z.boolean().default(false)) 
export const UPLOAD_DIR = getEnvVar("UPLOAD_DIR", z.string().default("./uploads"))
export const TICK_RATE = getEnvVar("TICK_RATE", z.number().default(12))
```


# FAQ*

*(Pronounced: fack-you)

## What about testing environment?

What about it? 🤨

Just set the env vars in your test envrimontment like above. If you use local env files, use somhting like `.env.test.local` where you can set every configurable piece of your shitty software to the desired output.

## But i am lazy

Then continue to write below average, unmaintainable, smelly code that piles up to an incomprehensable shit pile of technical debt!

---

Bye 🫶