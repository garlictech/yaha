module.exports = {
  collectCoverageFrom: ['src/**/*.{js,ts}'],
  displayName: 'backend',

  globals: {
    'ts-jest': { tsconfig: '<rootDir>/tsconfig.spec.json' },
  },
  transform: {
    '^.+\\.[tj]s$': 'ts-jest',
  },
  moduleFileExtensions: ['ts', 'js', 'html'],
  coverageDirectory: '../../coverage/apps/backend',
  preset: '../../jest.preset.ts',
};
