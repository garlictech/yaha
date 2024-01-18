module.exports = {
  collectCoverageFrom: ['src/**/*.{js,ts}'],
  displayName: 'cicd',

  globals: {},
  transform: {
    '^.+\\.[tj]s$': [
      'ts-jest',
      {
        tsConfig: '<rootDir>/tsconfig.spec.json',
      },
    ],
  },
  moduleFileExtensions: ['ts', 'js', 'html'],
  coverageDirectory: '../../coverage/apps/cicd',
  preset: '../../jest.preset.ts',
};
