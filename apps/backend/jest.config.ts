module.exports = {
  collectCoverageFrom: ['src/**/*.{js,ts}'],
  displayName: 'backend',

  globals: {},
  transform: {
    '^.+\\.[tj]s$': ['ts-jest', { tsconfig: '<rootDir>/tsconfig.spec.json' }],
  },
  moduleFileExtensions: ['ts', 'js', 'html'],
  coverageDirectory: '../../coverage/apps/backend',
  preset: '../../jest.preset.ts',
};
