module.exports = {
  env: {
    browser: true,
    es6: true
  },
  extends: "eslint:recommended",
  parserOptions: {
    ecmaFeatures: {
      experimentalObjectRestSpread: true,
      jsx: true
    },
    sourceType: "module"
  },
  plugins: ["react"],
  rules: {
    camelcase: "error",
    "comma-dangle": ["error", "only-multiline"],
    "comma-style": ["error", "last"],
    eqeqeq: "error",
    indent: ["error", 2, { VariableDeclarator: 2 }],
    "linebreak-style": ["error", "unix"],
    "no-eq-null": "error",
    "no-extra-parens": "error",
    "no-extra-semi": "error",
    "no-lonely-if": "error",
    "no-multi-spaces": 0,
    "no-nested-ternary": "error",
    "no-param-reassign": "error",
    "no-self-compare": "error",
    "no-shadow": "error",
    "no-throw-literal": "error",
    "no-undef": "error",
    "no-underscore-dangle": 0,
    "no-void": "error",
    quotes: ["error", "double"],
    semi: ["error", "always"]
  }
};
