/* checksum : 751adbf3834198ced182a8e416f0858b */
@Capabilities.BatchSupported : false
@Capabilities.KeyAsSegmentSupported : true
@Core.Description : 'SAP Analytics Cloud Tenant API'
@Core.SchemaVersion : '1.0'
@Core.LongDescription : 'The SAP Analytics Cloud Tenant API is based on OpenAPI Specifications. The API allows third party applications access to story and user data stored on an SAP Analytics Cloud tenant. The API is best used for requesting small amounts of data in real time. You must have a tenant URL and SAP Analytics Cloud user credentials to use this API.'
service SAP.Analytics.Cloud.Tenant.API {};

@Common.Label : 'Permissions'
@Core.Description : 'Returns access details for multiple resources'
@Core.LongDescription : 'Returns the permissions details for all resources specified in the request''s body. Results include lists of  grantees with their IDs and access levels. Intended for interface with SuccessFactors roles and groups only. This is not a general-use endpoint.'
@openapi.path : '/v1/permissions'
action SAP.Analytics.Cloud.Tenant.API.v1_permissions_post(
  @openapi.in : 'body'
  body : many String
) returns many SAP.Analytics.Cloud.Tenant.API_types.Permission;

@Common.Label : 'Permissions'
@Core.Description : 'Updates access permissions for all specified resources'
@Core.LongDescription : 'Updates the permissions for grantees associated with each resource indicated in the request body. All grantees not included in the request will not have access to specified resources. Intended for interface with SuccessFactors roles and groups only. This is not a general-use endpoint.'
@openapi.method : 'PATCH'
@openapi.path : '/v1/permissions'
action SAP.Analytics.Cloud.Tenant.API.v1_permissions_patch(
  @openapi.in : 'body'
  body : SAP.Analytics.Cloud.Tenant.API_types.SetShareRequestBody
) returns many SAP.Analytics.Cloud.Tenant.API_types.Permission;

@Common.Label : 'Permissions'
@Core.Description : 'Returns information on who has access to this resource'
@Core.LongDescription : 'Returns a list of IDs and access levels for all grantees who have permissions to access the specified resource. Intended for interface with SuccessFactors roles and groups only. This is not a general-use endpoint.'
@openapi.path : '/v1/permissions/{resourceId}'
function SAP.Analytics.Cloud.Tenant.API.v1_permissions_(
  @description : 'The ID of the resource to query. The ID must match a resource ID in SAP Analytics Cloud.'
  @openapi.in : 'path'
  resourceId : String
) returns SAP.Analytics.Cloud.Tenant.API_types.Permission;

@Common.Label : 'Permissions'
@Core.Description : 'Revokes the default (ALL) grantee''s access to a resource'
@Core.LongDescription : 'Removes the default permissions to the resource with the given ID. When successful, the default tenant access to the resource is removed. Note: Users may still have access if granted through a TEAM or USER permission. Intended for interface with SuccessFactors roles and groups only. This is not a general-use endpoint.'
@openapi.method : 'DELETE'
@openapi.path : '/v1/permissions/{resourceId}/ALL'
action SAP.Analytics.Cloud.Tenant.API.v1_permissions__ALL_delete(
  @description : 'The ID of the resource to remove access to. The ID must match a resource ID in SAP Analytics Cloud.'
  @openapi.in : 'path'
  resourceId : String
);

@Common.Label : 'Permissions'
@Core.Description : 'Revokes a grantee''s access to a resource'
@Core.LongDescription : 'Removes the grantee''s permissions to the specified resource. When successful, the grantee will have no explicit access to the resource. Note: A grantee may still have access if permissions are given through TEAM or ALL permissions. Intended for interface with SuccessFactors roles and groups only. This is not a general-use endpoint.'
@openapi.method : 'DELETE'
@openapi.path : '/v1/permissions/{resourceId}/{granteeType}/{granteeId}'
action SAP.Analytics.Cloud.Tenant.API.v1_permissions____delete(
  @description : 'The ID of the resource to remove access to. The ID must match a resource ID in SAP Analytics Cloud.'
  @openapi.in : 'path'
  resourceId : String,
  @description : 'The type of grantee to remove (USER, TEAM).'
  @openapi.in : 'path'
  granteeType : String,
  @description : 'The ID of the grantee to remove. Do not prefix with the tenant ID.'
  @openapi.in : 'path'
  granteeId : String
);

@Common.Label : 'Resources'
@Core.Description : 'Resources'
@Core.LongDescription : 'OData 2.0 service that returns Resources type metadata. For access to non-Resource type metadata, reference Metadata endpoint. Reference for OData 2.0 URI conventions: https://www.odata.org/documentation/odata-version-2-0/uri-conventions/.'
@openapi.path : '/v1/Resources'
function SAP.Analytics.Cloud.Tenant.API.v1_Resources() returns Boolean;

@Common.Label : 'Metadata'
@Core.Description : 'Metadata'
@Core.LongDescription : 'OData 2.0 service that returns service metadata information. More information at: https://www.odata.org/blog/queryable-odata-metadata/. Reference for OData 2.0 URI conventions: https://www.odata.org/documentation/odata-version-2-0/uri-conventions/.'
@openapi.path : '/v1/$metadata'
function SAP.Analytics.Cloud.Tenant.API.v1__metadata() returns Boolean;

@Common.Label : 'Groups'
@Core.Description : 'Query groups'
@Core.LongDescription : 'Queries the list of groups. Results are paginated'
@openapi.path : '/v1/scim/Groups'
function SAP.Analytics.Cloud.Tenant.API.v1_scim_Groups(
  @description : 'The 1-based start index for pagination. Default: 1'
  @openapi.in : 'query'
  startIndex : Integer64,
  @description : 'The number of users in the page. Default: 50'
  @openapi.in : 'query'
  count : Integer64
) returns many SAP.Analytics.Cloud.Tenant.API_types.Group;

@Common.Label : 'Groups'
@Core.Description : 'Creates a group'
@Core.LongDescription : 'Creates a new group with the given group object'
@openapi.path : '/v1/scim/Groups'
action SAP.Analytics.Cloud.Tenant.API.v1_scim_Groups_post(
  @openapi.in : 'body'
  body : SAP.Analytics.Cloud.Tenant.API_types.Group
) returns SAP.Analytics.Cloud.Tenant.API_types.Group;

@Common.Label : 'Groups'
@Core.Description : 'Returns a group'
@Core.LongDescription : 'Returns the group with the given groupId'
@openapi.path : '/v1/scim/Groups/{id}'
function SAP.Analytics.Cloud.Tenant.API.v1_scim_Groups_(
  @description : 'The groupId of the group'
  @openapi.in : 'path'
  id : String
) returns SAP.Analytics.Cloud.Tenant.API_types.Group;

@Common.Label : 'Groups'
@Core.Description : 'Updates a group'
@Core.LongDescription : 'Updates the given groupId with the group object'
@openapi.method : 'PUT'
@openapi.path : '/v1/scim/Groups/{id}'
action SAP.Analytics.Cloud.Tenant.API.v1_scim_Groups__put(
  @description : 'The groupId of the group to be updated'
  @openapi.in : 'path'
  id : String,
  @openapi.in : 'body'
  body : SAP.Analytics.Cloud.Tenant.API_types.Group
) returns SAP.Analytics.Cloud.Tenant.API_types.Group;

@Common.Label : 'Groups'
@Core.Description : 'Deletes a group'
@Core.LongDescription : 'Finds the group object with the given groupId and deletes it if it exists'
@openapi.method : 'DELETE'
@openapi.path : '/v1/scim/Groups/{id}'
action SAP.Analytics.Cloud.Tenant.API.v1_scim_Groups__delete(
  @description : 'The groupId of the group'
  @openapi.in : 'path'
  id : String
);

@Common.Label : 'Users'
@Core.Description : 'Returns a user'
@Core.LongDescription : 'Returns the user with the given userId'
@openapi.path : '/v1/scim/Users/{id}'
function SAP.Analytics.Cloud.Tenant.API.v1_scim_Users_(
  @description : 'The user ID without fully-qualified name'
  @openapi.in : 'path'
  id : String
) returns SAP.Analytics.Cloud.Tenant.API_types.User;

@Common.Label : 'Users'
@Core.Description : 'Updates a user'
@Core.LongDescription : 'Updates the given userId with the user object'
@openapi.method : 'PUT'
@openapi.path : '/v1/scim/Users/{id}'
action SAP.Analytics.Cloud.Tenant.API.v1_scim_Users__put(
  @description : 'The user ID without fully-qualified name'
  @openapi.in : 'path'
  id : String,
  @openapi.in : 'body'
  body : SAP.Analytics.Cloud.Tenant.API_types.User
) returns SAP.Analytics.Cloud.Tenant.API_types.User;

@Common.Label : 'Users'
@Core.Description : 'Deletes a user'
@Core.LongDescription : 'Finds the user object with the given userId and deletes it if it exists'
@openapi.method : 'DELETE'
@openapi.path : '/v1/scim/Users/{id}'
action SAP.Analytics.Cloud.Tenant.API.v1_scim_Users__delete(
  @description : 'The user ID without fully-qualified name'
  @openapi.in : 'path'
  id : String
);

@Common.Label : 'Users'
@Core.Description : 'Query users'
@Core.LongDescription : 'Queries the list of users. Results are paginated'
@openapi.path : '/v1/scim/Users'
function SAP.Analytics.Cloud.Tenant.API.v1_scim_Users(
  @description : 'The 1-based start index for pagination. Default: 1'
  @openapi.in : 'query'
  startIndex : Integer64,
  @description : 'The number of users in the page. Default: 50'
  @openapi.in : 'query'
  count : Integer64,
  @description : 'The filter expression'
  @openapi.in : 'query'
  filter : String
) returns many SAP.Analytics.Cloud.Tenant.API_types.User;

@Common.Label : 'Users'
@Core.Description : 'Creates a user'
@Core.LongDescription : 'Creates a new user with the given user object'
@openapi.path : '/v1/scim/Users'
action SAP.Analytics.Cloud.Tenant.API.v1_scim_Users_post(
  @openapi.in : 'body'
  body : SAP.Analytics.Cloud.Tenant.API_types.User
) returns SAP.Analytics.Cloud.Tenant.API_types.User;

@Common.Label : 'Stories'
@Core.Description : 'Returns a list of stories and story metadata.'
@Core.LongDescription : 'Returns a list of stories and story metadata. Only information that the user has access to will appear.'
@openapi.path : '/v1/stories'
function SAP.Analytics.Cloud.Tenant.API.v1_stories(
  @description : 'Specifies additional metadata to include in the response. For example, ''models'' will include the metadata of the models in each story returned in the response. Possible values: models. Note: Currently, only ''models'' is supported as a parameter.'
  @assert.range : true
  @openapi.in : 'query'
  include : String enum {
    models;
  }
) returns many SAP.Analytics.Cloud.Tenant.API_types.Story;

@Common.Label : 'Stories'
@Core.Description : 'Copies a story.'
@Core.LongDescription : 'Copies an existing story to the specified parent resource ID. By default, it will create it in the source folder. The body contains the optional new name.'
@openapi.path : '/v1/stories'
action SAP.Analytics.Cloud.Tenant.API.v1_stories_post(
  @description : 'Resource ID of the source story'
  @openapi.in : 'query'
  @openapi.required : true
  copyFrom : String,
  @description : 'Resource ID of the target folder. If not specified then the new story would be created under the same folder as the existing story'
  @openapi.in : 'query'
  copyTo : String,
  @openapi.in : 'body'
  body : SAP.Analytics.Cloud.Tenant.API_types.ModifiedStory
) returns SAP.Analytics.Cloud.Tenant.API_types.StoryCopyResponse;

@Common.Label : 'Stories'
@Core.Description : 'Deletes the specified story.'
@Core.LongDescription : 'Takes the resource ID of a story and deletes it.'
@openapi.method : 'DELETE'
@openapi.path : '/v1/stories/{id}'
action SAP.Analytics.Cloud.Tenant.API.v1_stories__delete(
  @description : 'Resource ID of the story to be deleted'
  @openapi.in : 'path'
  id : String
);

@Common.Label : 'Stories'
@Core.Description : 'Renames a story.'
@Core.LongDescription : 'Takes the resource ID of a story and its new name and renames the story.'
@openapi.method : 'PATCH'
@openapi.path : '/v1/stories/{id}'
action SAP.Analytics.Cloud.Tenant.API.v1_stories__patch(
  @description : 'Resource ID of the story to be changed'
  @openapi.in : 'path'
  id : String,
  @openapi.in : 'body'
  body : SAP.Analytics.Cloud.Tenant.API_types.ModifiedStory
) returns SAP.Analytics.Cloud.Tenant.API_types.ModifiedStory;

@description : 'An SAP Analytics Cloud user, team, or the default access level for all users on a tenant.'
type SAP.Analytics.Cloud.Tenant.API_types.Grantee {
  granteeId : String;
  @description : 'The grantee''s type. USER, TEAM or ALL'
  granteeType : String;
  @description : 'An array of access values that define the access level this grantee has to the specified resource.'
  access : many SAP.Analytics.Cloud.Tenant.API.anonymous.type0;
  xsCompliantGranteeId : String;
};

type SAP.Analytics.Cloud.Tenant.API_types.GranteeAll : SAP.Analytics.Cloud.Tenant.API_types.Grantee {
  @description : 'The grantee''s type, ALL'
  granteeType : String;
};

type SAP.Analytics.Cloud.Tenant.API_types.GranteeTeam : SAP.Analytics.Cloud.Tenant.API_types.Grantee {
  @description : 'The grantee''s ID in SAP Analytics Cloud'
  granteeId : String;
  @description : 'The grantee''s type, TEAM'
  granteeType : String;
};

type SAP.Analytics.Cloud.Tenant.API_types.GranteeUser : SAP.Analytics.Cloud.Tenant.API_types.Grantee {
  @description : 'The grantee''s ID in SAP Analytics Cloud.'
  granteeId : String;
  @description : 'The grantee''s type, USER'
  granteeType : String;
};

@description : 'A list of grantee objects and an ID for the resource to grant access to.'
type SAP.Analytics.Cloud.Tenant.API_types.Permission {
  @description : 'The ID of the resource to grant access to. Stories, folders, and models are supported.'
  resourceId : String;
  @description : 'A list of grantee objects that define user, team, or default access to the given resource.'
  grantees : many SAP.Analytics.Cloud.Tenant.API_types.Grantee;
};

type SAP.Analytics.Cloud.Tenant.API_types.ErrorResponse {
  status : String;
  code : String;
  message : String;
  stack : String;
  detail : many { };
};

type SAP.Analytics.Cloud.Tenant.API_types.SetShareRequestBody {
  @description : 'A boolean indicating whether permissions should cascade to folder contents.'
  cascade : Boolean;
  @description : 'A list of permission objects to set.'
  permissions : many SAP.Analytics.Cloud.Tenant.API_types.Permission;
};

@description : 'SAP Analytics Cloud Group (aka Team)'
type SAP.Analytics.Cloud.Tenant.API_types.Group {
  schemas : many String;
  id : String;
  displayName : String;
  meta : SAP.Analytics.Cloud.Tenant.API_types.ScimResourceMetadata;
  members : many SAP.Analytics.Cloud.Tenant.API_types.ScimGroupMember;
  roles : many String;
};

type SAP.Analytics.Cloud.Tenant.API_types.ScimGroupMember {
  type : String;
  value : String;
  @openapi.name : '$ref'
  _ref : String;
};

type SAP.Analytics.Cloud.Tenant.API_types.ScimResourceMetadata {
  created : String;
  location : String;
  resourceType : String;
};

// type SAP.Analytics.Cloud.Tenant.API_types.BadRequestException {
//   cause : SAP.Analytics.Cloud.Tenant.API_types.Throwable;
//   stackTrace : many SAP.Analytics.Cloud.Tenant.API_types.StackTraceElement;
//   response : SAP.Analytics.Cloud.Tenant.API_types.Response;
//   localizedMessage : String;
//   message : String;
//   suppressed : many SAP.Analytics.Cloud.Tenant.API_types.Throwable;
// };

type SAP.Analytics.Cloud.Tenant.API_types.EntityTag {
  value : String;
  weak : Boolean;
};

type SAP.Analytics.Cloud.Tenant.API_types.Link {
  type : String;
  params : { };
  uri : String;
  title : String;
  rels : many String;
  rel : String;
  uriBuilder : SAP.Analytics.Cloud.Tenant.API_types.UriBuilder;
};

type SAP.Analytics.Cloud.Tenant.API_types.Locale {
  language : String;
  country : String;
  displayCountry : String;
  displayLanguage : String;
  displayName : String;
  displayScript : String;
  displayVariant : String;
  extensionKeys : many String;
  iso3Country : String;
  iso3Language : String;
  script : String;
  unicodeLocaleAttributes : many String;
  unicodeLocaleKeys : many String;
  variant : String;
};

type SAP.Analytics.Cloud.Tenant.API_types.MediaType {
  type : String;
  subtype : String;
  parameters : { };
  wildcardType : Boolean;
  wildcardSubtype : Boolean;
};

type SAP.Analytics.Cloud.Tenant.API_types.NewCookie {
  name : String;
  value : String;
  version : Integer;
  path : String;
  domain : String;
  comment : String;
  maxAge : Integer;
  expiry : Timestamp;
  secure : Boolean;
  httpOnly : Boolean;
};

type SAP.Analytics.Cloud.Tenant.API_types.Response {
  length : Integer;
  language : SAP.Analytics.Cloud.Tenant.API_types.Locale;
  location : String;
  lastModified : Timestamp;
  date : Timestamp;
  entity : { };
  headers : { };
  stringHeaders : { };
  links : many SAP.Analytics.Cloud.Tenant.API_types.Link;
  entityTag : SAP.Analytics.Cloud.Tenant.API_types.EntityTag;
  cookies : { };
  status : Integer;
  mediaType : SAP.Analytics.Cloud.Tenant.API_types.MediaType;
  allowedMethods : many String;
  statusInfo : SAP.Analytics.Cloud.Tenant.API_types.StatusType;
  metadata : { };
};

type SAP.Analytics.Cloud.Tenant.API_types.StackTraceElement {
  methodName : String;
  fileName : String;
  lineNumber : Integer;
  className : String;
  nativeMethod : Boolean;
};

type SAP.Analytics.Cloud.Tenant.API_types.StatusType {
  statusCode : Integer;
  @assert.range : true
  family : String enum {
    INFORMATIONAL;
    SUCCESSFUL;
    REDIRECTION;
    CLIENT_ERROR;
    SERVER_ERROR;
    OTHER;
  };
  reasonPhrase : String;
};

// type SAP.Analytics.Cloud.Tenant.API_types.Throwable {
//   cause : SAP.Analytics.Cloud.Tenant.API_types.Throwable;
//   stackTrace : many SAP.Analytics.Cloud.Tenant.API_types.StackTraceElement;
//   localizedMessage : String;
//   message : String;
//   suppressed : many SAP.Analytics.Cloud.Tenant.API_types.Throwable;
// };

type SAP.Analytics.Cloud.Tenant.API_types.UriBuilder { };

// type SAP.Analytics.Cloud.Tenant.API_types.ForbiddenException {
//   cause : SAP.Analytics.Cloud.Tenant.API_types.Throwable;
//   stackTrace : many SAP.Analytics.Cloud.Tenant.API_types.StackTraceElement;
//   response : SAP.Analytics.Cloud.Tenant.API_types.Response;
//   localizedMessage : String;
//   message : String;
//   suppressed : many SAP.Analytics.Cloud.Tenant.API_types.Throwable;
// };

// type SAP.Analytics.Cloud.Tenant.API_types.NotFoundException {
//   cause : SAP.Analytics.Cloud.Tenant.API_types.Throwable;
//   stackTrace : many SAP.Analytics.Cloud.Tenant.API_types.StackTraceElement;
//   response : SAP.Analytics.Cloud.Tenant.API_types.Response;
//   localizedMessage : String;
//   message : String;
//   suppressed : many SAP.Analytics.Cloud.Tenant.API_types.Throwable;
// };

// type SAP.Analytics.Cloud.Tenant.API_types.InternalServerErrorException {
//   cause : SAP.Analytics.Cloud.Tenant.API_types.Throwable;
//   stackTrace : many SAP.Analytics.Cloud.Tenant.API_types.StackTraceElement;
//   response : SAP.Analytics.Cloud.Tenant.API_types.Response;
//   localizedMessage : String;
//   message : String;
//   suppressed : many SAP.Analytics.Cloud.Tenant.API_types.Throwable;
// };

type SAP.Analytics.Cloud.Tenant.API_types.ScimCustomUserParameters {
  @description : 'The preferred language to be used in live data connections'
  dataAccessLanguage : String;
  @description : 'Date formatting scheme'
  dateFormatting : String;
  @description : 'Time formatting scheme'
  timeFormatting : String;
  @description : 'Number formatting scheme'
  numberFormatting : String;
  @description : 'Number of days to wait before cleaning up notifications'
  cleanUpNotificationsNumberOfDays : Integer;
  @description : 'True if user wants emails for system notifications'
  systemNotificationsEmailOptIn : Boolean;
  @description : 'True if user wants emails for product updates and learning'
  marketingEmailOptIn : Boolean;
  @description : 'Set to true if the user has a concurrent license.'
  isConcurrent : Boolean;
};

type SAP.Analytics.Cloud.Tenant.API_types.ScimUserEmail {
  value : String;
  type : String;
  primary : Boolean;
};

type SAP.Analytics.Cloud.Tenant.API_types.ScimUserEnterpriseUser {
  manager : SAP.Analytics.Cloud.Tenant.API_types.ScimUserEnterpriseUserManager;
};

type SAP.Analytics.Cloud.Tenant.API_types.ScimUserEnterpriseUserManager {
  managerId : String;
};

type SAP.Analytics.Cloud.Tenant.API_types.ScimUserGroup {
  value : String;
  display : String;
  @openapi.name : '$ref'
  _ref : String;
};

type SAP.Analytics.Cloud.Tenant.API_types.ScimUserPhoto {
  value : String;
  type : String;
};

type SAP.Analytics.Cloud.Tenant.API_types.ScimUserUsername {
  givenName : String;
  familyName : String;
};

@description : 'SAP Analytics Cloud User'
type SAP.Analytics.Cloud.Tenant.API_types.User {
  schemas : many String;
  @description : 'UserName, the same as user ID'
  userName : String;
  @description : 'User ID, the same as userName'
  id : String;
  @description : 'Indicates the User''s preferred language'
  preferredLanguage : String;
  @description : 'User metadata'
  meta : SAP.Analytics.Cloud.Tenant.API_types.ScimResourceMetadata;
  @description : 'User''s complex name object'
  name : SAP.Analytics.Cloud.Tenant.API_types.ScimUserUsername;
  @description : 'User display name'
  displayName : String;
  @description : 'Whether the user is active'
  active : Boolean;
  @description : 'User complex object, containing the one email provided'
  emails : many SAP.Analytics.Cloud.Tenant.API_types.ScimUserEmail;
  @description : 'Adds a link to a user profile photo.'
  photos : many SAP.Analytics.Cloud.Tenant.API_types.ScimUserPhoto;
  @description : 'User''s list of roles'
  roles : many String;
  @description : 'User''s read-only list of groups (aka. teams)'
  groups : many SAP.Analytics.Cloud.Tenant.API_types.ScimUserGroup;
  @description : 'User''s profile settings'
  @openapi.name : 'urn:ietf:params:scim:schemas:extension:sap:user-custom-parameters:1.0'
  urn_ietf_params_scim_schemas_extension_sap_user_custom_parameters_1_0 : SAP.Analytics.Cloud.Tenant.API_types.ScimCustomUserParameters;
  @description : 'User''s enterprise information (currently containing manager only)'
  @openapi.name : 'urn:scim:schemas:extension:enterprise:1.0'
  urn_scim_schemas_extension_enterprise_1_0 : SAP.Analytics.Cloud.Tenant.API_types.ScimUserEnterpriseUser;
};

@description : 'SAP Analytics Cloud model information.'
type SAP.Analytics.Cloud.Tenant.API_types.Model {
  @description : 'The user defined description of the model. This may be an empty string, null, or undefined'
  description : String;
  @description : 'The external ID for the model. Note: Only models based on remote connections have an external ID'
  externalId : String;
  id : String;
  @description : 'An array of remoteConnect objects. Note: Only models based on remote data sources have remote connection information'
  remoteConnection : SAP.Analytics.Cloud.Tenant.API_types.RemoteConnection;
  @description : 'Set to TRUE if the story can be read by current user'
  isPlanning : Boolean;
};

@description : 'Only models based on remote data sources have remote connection information. All remote connections will have id, connectionType and systemType attributes. Different remote connections can have different sets of attributes based on the connection type and the system type. Note: Only the attributes applicable to the remote system type the model is stored on will appear in the response.'
type SAP.Analytics.Cloud.Tenant.API_types.RemoteConnection {
  @description : 'The remote connection type. Possible values: DIRECT, PATH, HCP, or CLOUD'
  connectionType : String;
  @description : 'The type of system that you are connecting to. For example, HANA, BW, or S/4HANA'
  systemType : String;
  @description : 'The remote connection name.'
  name : String;
  @description : 'Will be set to either HTTP or HTTPS'
  protocol : String;
  @description : 'The client ID for the system you are connecting to. Note: The value is always returned as a string even if the ID uses numbers'
  client : String;
  @description : 'The language used by the remote system. For example, EN'
  language : String;
  @description : 'The name of the database used in the remote system'
  database : String;
  @description : 'The prefix used for creating the connection'
  pathPrefix : String;
  @description : 'The host for the remote system'
  host : String;
  @description : 'The port used for connecting to the remote system. Note: The value is always returned as a string'
  port : String;
  @description : 'The remote connection ID'
  id : String;
  @description : 'The SAP Cloud Platform account name'
  scpAccount : String;
};

@description : 'SAP Analytics Cloud Story'
type SAP.Analytics.Cloud.Tenant.API_types.Story {
  @description : 'The user-specified name for a story'
  name : String;
  @description : 'The user defined story description. Note: This may be an empty string, null, or undefined'
  description : String;
  @description : 'The user ID of the story creator'
  createdBy : String;
  @description : 'The story ID'
  id : String;
  @description : 'The ISO format timestamp for when the story was created'
  created : String;
  @description : 'The ISO format timestamp for when the story was last modified. If the story has not been edited since it was created, this value will match the created timestamp'
  changed : String;
  @description : 'Set to TRUE if the story is a template'
  isTemplate : Boolean;
  @description : 'Set to TRUE if the story is a sample included with SAP Analytics Cloud'
  isSample : Boolean;
  @description : 'An array of models used in the story. Note: This property only appears if the story includes models'
  models : many SAP.Analytics.Cloud.Tenant.API_types.Model;
  @description : 'The ID of the user that last modified the story'
  changedBy : String;
  @description : 'The root-relative URL for navigating directly to the story'
  openURL : String;
};

@description : 'SAP Analytics Cloud Updatable Story Attributes'
type SAP.Analytics.Cloud.Tenant.API_types.ModifiedStory {
  @description : 'The user-specified name for a story'
  name : String;
};

@description : 'Response containing the mapping between ID of copied story and target story'
type SAP.Analytics.Cloud.Tenant.API_types.StoryCopyResponse {
  @description : 'resourceMappings'
  resourceMappings : { };
};

@description : 'Story ID of the created story'
type SAP.Analytics.Cloud.Tenant.API_types.targetResourceId {
  @description : 'targetResourceId'
  targetResourceId : String;
};

@assert.range : true
type SAP.Analytics.Cloud.Tenant.API.anonymous.type0 : String enum {
  DENY;
  SHARE;
  READ;
  UPDATE;
  DELETE;
  CREATE_DOC;
  CREATE_FOLDER;
  MAINTAIN;
};

