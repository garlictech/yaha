module.exports = {
  collectCoverageFrom: ['src/**/*.{js,ts}'],
  displayName: 'shared-config',

  globals: {},
  transform: {
    '^.+\\.[tj]sx?$': ['ts-jest', { tsconfig: '<rootDir>/tsconfig.spec.json' }],
  },
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx'],
  coverageDirectory: '../../../coverage/libs/shared/config',
  preset: '../../../jest.preset.ts',
};
