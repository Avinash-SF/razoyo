# Razoyo

Fraud is being detected in when we send a request with same access_token for a second time. Need to find a work arround.

Solution might be to generate new access_token by sending the client secret back to server.

**or**

Am I missing something here? The documentation isn't clear, it doesn't provide much Info.

Ohhh, yeah! We also need to store that new access_token in Mnesia or PostGreSQL

- Let's go with postgres
