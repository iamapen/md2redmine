module.exports = {
  verbose: true,
  transform: {
    '^.+\\.js$'  : '<rootDir>/node_modules/babel-jest',
//    '.*\\.(ts)$' : '<rootDir>/node_modules/ts-jest',    // TypeScriptファイルをテストする場合
//    '.*\\.(vue)$': '<rootDir>/node_modules/vue-jest'    // Vueファイルをテストする場合
  },
  moduleFileExtensions: ['js', 'ts', 'vue'] // テスト対象の拡張子を列挙する
};

