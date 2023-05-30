// Below code is from CDS Import from earlier step
using { SAP.Analytics.Cloud.Tenant.API_types.User as UserType } from './external/Story_API';
type UserTyp{
  userName : String;
  id : String;
}
//  @(requires: 'authenticated-user')
// New service to expose a function import
service sacUserCatalog @(path : '/catalog')
@(requires: 'authenticated-user')
{
    function getUsers() returns array of  UserType;
    function createUsers() returns array of UserType;
}

// service sactest{
//     // define type {};
//     type Usr {
//         userName : String;
//         id : String;
//     }
//     function getUsers() returns array of Usr;
// }
