# Managing Layers with Authentication

In Netherlands3D, certain data layers require user authentication to be accessed and displayed. This guide explains how
the system manages authentication for these layers, handles different types of credentials, and ensures sensitive
information remains protected while maintaining layer visibility settings.

## 1. Layer Authentication Process

When a user adds a layer that requires authentication, they are prompted to provide credentials in one of the
following forms:

- Username and Password
- Access Key

Regardless of the credential type, the system records that the source associated with the layer (typically the layer's
URL) requires authentication. This information is stored in a KeyVault.

## 2. Credential Storage and Security

To ensure that sensitive information is never compromised:

- **Credentials are not stored in the project file**. Instead, the KeyVault retains only the metadata necessary to 
  recognize that the layer is protected and requires credentials.
- The **KeyVault** is saved alongside the project, but it **does not contain the actual credentials**, only the 
  authentication type and associated layer source.
- This design prevents sensitive credentials from being shared when the project file is distributed to third parties,
  ensuring privacy and security.

## 3. Handling Credentials: HTTP Basic Authentication vs. Access Key

The system supports two main methods of authentication, depending on the type of credentials provided by the user:

- **HTTP Basic Authentication (Username and Password)**: If the user provides a username and password, the system 
  queries the protected endpoint using HTTP Basic Authentication. This involves sending the credentials in the request 
  header in accordance with the Basic Authentication protocol.

- **Access Key**: If an access key is provided, the system attempts to use the key within the query string of the 
  endpoint's URL. The application performs auto-detection to determine the appropriate query parameter name by testing 
  common parameters like:

  - `code`
  - `key`
  - `token`

  The system will make repeated requests to the endpoint using each query parameter name and observe the HTTP response. 
  If the server returns an **HTTP status code 401 (Unauthorized)** or **403 (Forbidden)** for each attempt, the 
  application concludes that the provided credential is incorrect. If a valid credential is found, the system records 
  the correct query parameter name in the KeyVault for future use.

## 4. Handling Layers Without Credentials

If a layer requiring authentication is added (either manually by the user or through reloading a project), and no
valid credentials are provided, the following behavior occurs:

- The layer enters a non-visible state, as it cannot be displayed without valid credentials.
- The system issues a warning prompting the user to enter (or re-enter) credentials for the layer.

**Note**: The user must resolve this issue by supplying valid credentials before the layer can be displayed.

## 5. Maintaining Layer Visibility Settings

One critical aspect of this system is that the visibility of the layer is preserved, even if it cannot be displayed
due to authentication issues:

- If the layer was hidden (via the eye icon) when the project was saved, it will remain hidden after authentication 
  is provided.
- Similarly, if the layer was visible, it will become visible once valid credentials are entered and the authentication
  issue is resolved.

This approach ensures that the visibility state is consistent and independent of the authentication status.

## 6. Temporary State of Authentication

The system does not store the authentication status (whether credentials have been verified or not) in the project
file. This is because authentication status is a **temporary state** that should not persist across sessions. Each time 
a project is loaded, the authentication process must be reinitiated for protected layers, ensuring that credentials are
entered securely and as needed.

## 7. Need to re-authenticate reopening the application

A key implication of this design is that users will need to re-authenticate any protected layers every time they reopen
the application or load a saved project file. Since credentials are never stored in the project file for security
reasons, the system requires users to provide valid credentials again when the project is reloaded.

This approach ensures that sensitive credentials are handled securely, but it also means that re-authentication is
necessary whenever a protected layer is accessed in a new session. Users should be aware that any protected layers will
initially be in a non-visible state until the required credentials are provided.

## 8. Warnings and User Flow

The current user flow for managing layer authentication includes:

- A warning message indicating that the layer cannot be displayed due to missing or invalid credentials.
- A prompt that allows the user to supply new credentials for the layer.
- Once the credentials are provided and validated, the layer’s display status is updated accordingly, without altering 
  its pre-existing visibility state.

By following this process, Netherlands3D ensures that users can securely manage layers requiring authentication while
maintaining proper visibility states and safeguarding sensitive data.
