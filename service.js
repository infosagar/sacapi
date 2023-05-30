const users = require('./generated/Story_API/users-api.js');
const cds = require('@sap/cds');
const conJwt = require ('@sap-cloud-sdk/connectivity')
module.exports = cds.service.impl(async function () {
    this.on('getUsers', async function(req){
      const jwt = conJwt.retrieveJwt(req);
        let results = {};
        try {
          var oQueryParameters={
              startIndex: 1,
              count: 200
          };
          results= await users.UsersApi.queryUsers(oQueryParameters).execute({ destinationName: "sacuser-sac-tenant-api", jwt: jwt});
          return results.Resources;
        } catch (error) {

          console.log(error)
        }
    
});

this.on('createUsers', async function(req){
  const jwt = conJwt.retrieveJwt(req);
    let results = {};
    try {
     var oData= {
        "schemas": [
            "urn:ietf:params:scim:schemas:core:2.0:User",
            "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User",
            "urn:ietf:params:scim:schemas:extension:sap:user-custom-parameters:1.0"
        ],
        "userName": "xxxxF3.xxxxL3@st.com",
        "id": "TESTFL3XXXXXX", 
        "preferredLanguage": "en",
        "name": {
            "givenName": "xxxxF3",
            "familyName": "xxxxL3"
        },
        "displayName": "xxxxFL3",
        "active": true,
        "emails": [
            {
                "value": "xxxxF3.xxxxL3@st.com",
                "type": "work",
                "primary": true
            }
        ],
        "photos": [],
        "roles": [
            "PROFILE:t.2:Z_Planning_Reporting"
        ],
        "groups": []
    }
      results= await users.UsersApi.createUser(oData).execute({ destinationName: "sacuser-sac-tenant-api", jwt: jwt});
      return results.Resources;
    } catch (error) {

      console.log(error)
    }

});

});