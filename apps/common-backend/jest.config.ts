module.exports = {
  displayName: 'common-backend',

  globals: {},
  testEnvironment: 'node',
  transform: {
    '^.+\\.[tj]s$': [
      'ts-jest',
      {
        tsconfig: '<rootDir>/tsconfig.spec.json',
      },
    ],
  },
  moduleFileExtensions: ['ts', 'js', 'html'],
  modulePathIgnorePatterns: ['cdk.out', '.build', '.serverless'],
  coverageDirectory: '../../coverage/apps/common-backend',
  preset: '../../jest.preset.ts',
};
