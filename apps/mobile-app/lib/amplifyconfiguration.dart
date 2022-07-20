const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "yaha": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://y5hivusu4vgp3jzg46h5revgfa.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-rl4ag3qecfgzzomxqnfltbatfi"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://y5hivusu4vgp3jzg46h5revgfa.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-rl4ag3qecfgzzomxqnfltbatfi",
                        "ClientDatabasePrefix": "yaha_API_KEY"
                    },
                    "yaha_AMAZON_COGNITO_USER_POOLS": {
                        "ApiUrl": "https://y5hivusu4vgp3jzg46h5revgfa.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "yaha_AMAZON_COGNITO_USER_POOLS"
                    },
                    "yaha_AWS_IAM": {
                        "ApiUrl": "https://y5hivusu4vgp3jzg46h5revgfa.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "yaha_AWS_IAM"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:b6943e16-0ef1-4727-ae68-56ba8916ac36",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_r0VBHq6to",
                        "AppClientId": "1d79g7kuqo1mj4lr8pmj1ec3pm",
                        "AppClientSecret": "7fftot4cgfpjrrbvnihshkm4v3bedmskf2oggk3jiab30fpn9j2",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "dev-yaha-consumer.auth.us-east-1.amazoncognito.com",
                            "AppClientId": "1d79g7kuqo1mj4lr8pmj1ec3pm",
                            "AppClientSecret": "7fftot4cgfpjrrbvnihshkm4v3bedmskf2oggk3jiab30fpn9j2",
                            "SignInRedirectURI": "yaha://signin/",
                            "SignOutRedirectURI": "yaha://signout/",
                            "Scopes": [
                                "aws.cognito.signin.user.admin",
                                "email",
                                "openid",
                                "phone",
                                "profile"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [
                            "FACEBOOK",
                            "GOOGLE",
                            "APPLE"
                        ],
                        "usernameAttributes": [],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 12,
                            "passwordPolicyCharacters": [
                                "REQUIRES_LOWERCASE",
                                "REQUIRES_UPPERCASE",
                                "REQUIRES_NUMBERS"
                            ]
                        },
                        "mfaConfiguration": "OPTIONAL",
                        "mfaTypes": [
                            "SMS",
                            "TOTP"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                }
            }
        }
    }
}''';