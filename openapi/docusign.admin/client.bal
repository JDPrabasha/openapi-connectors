// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/mime;

# This is a generated connector for [DocuSign Admin API](https://developers.docusign.com/docs/admin-api/) OpenAPI specification. An API for an organization administrator to manage organizations, accounts and users which enables you to automate user management with your existing systems while ensuring governance and compliance.
@display {label: "DocuSign Admin", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [DocuSign account](https://www.docusign.com/) and obtain tokens by following [this guide](https://developers.docusign.com/docs/admin-api/admin101/auth/).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.docusign.net/Management") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns a list of organizations that the authenticated user belongs to.
    #
    # + mode - Specifies how to select the organizations. Valid values: - `org_admin`: Returns organizations for which the authenticated user is an admin. - `account_membership`: Returns organizations that contain an account of which the authenticated user is a member Default value: `org_admin` 
    # + return - OK 
    remote isolated function getOrganizationList(string? mode = ()) returns OrganizationsResponse|error {
        string resourcePath = string `/v2/organizations`;
        map<anydata> queryParam = {"mode": mode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OrganizationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the list of permission profiles in an account.
    #
    # + organizationId - The organization ID Guid 
    # + accountId - The account ID Guid 
    # + return - OK 
    remote isolated function getAccountsPermissionProfiles(string organizationId, string accountId) returns PermissionsResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/permissions`;
        PermissionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the list of groups in an account.
    #
    # + organizationId - The organization ID Guid 
    # + accountId - The account ID Guid 
    # + 'start - Index of first item to include in the response. The default value is 0. 
    # + take - Page size of the response. The default value is 20. 
    # + end - Index of the last item to include in the response. Ignored if `take` parameter is specified. 
    # + return - OK 
    remote isolated function getGroupsInAccount(string organizationId, string accountId, int? 'start = (), int? take = (), int? end = ()) returns MemberGroupsResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/groups`;
        map<anydata> queryParam = {"start": 'start, "take": take, "end": end};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MemberGroupsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of pending and completed export requests.
    #
    # + organizationId - The organization ID Guid 
    # + return - OK 
    remote isolated function getOrganizationExportRequests(string organizationId) returns OrganizationExportsResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/exports/user_list`;
        OrganizationExportsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a user list export request.
    #
    # + organizationId - The organization ID Guid 
    # + payload - Enables you to specify the kind of export request. 
    # + return - OK 
    remote isolated function createUserListExportRequest(string organizationId, OrganizationExportRequest payload) returns OrganizationExportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/exports/user_list`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrganizationExportResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of pending and completed account settings export request.
    #
    # + organizationId - The organization ID Guid 
    # + return - OK 
    remote isolated function getAccountSettingExportRequests(string organizationId) returns OrganizationExportsResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/exports/account_settings`;
        OrganizationExportsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a  new account settings export request.
    #
    # + organizationId - The organization ID Guid 
    # + payload - Organization account request. 
    # + return - OK 
    remote isolated function createAccountSettingsExportRequest(string organizationId, OrganizationAccountsRequest payload) returns OrganizationExportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/exports/account_settings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrganizationExportResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the results for single user list export request.
    #
    # + organizationId - The organization ID Guid 
    # + exportId - The export ID GUID for the request. 
    # + return - OK 
    remote isolated function getUserListExportRequestByExportId(string organizationId, string exportId) returns OrganizationExportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/exports/user_list/${getEncodedUri(exportId)}`;
        OrganizationExportResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a single user list export request.
    #
    # + organizationId - The organization ID Guid 
    # + exportId - The export ID GUID for the request. 
    # + return - OK 
    remote isolated function deleteUserListExpotByExportId(string organizationId, string exportId) returns json|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/exports/user_list/${getEncodedUri(exportId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns the results for a single account settings export request.
    #
    # + organizationId - The organization ID Guid 
    # + exportId - The export ID GUID for the request. 
    # + return - OK 
    remote isolated function getAccountSettingsExportByExportId(string organizationId, string exportId) returns OrganizationExportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/exports/account_settings/${getEncodedUri(exportId)}`;
        OrganizationExportResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a single account settings export request.
    #
    # + organizationId - The organization ID Guid 
    # + exportId - The export ID GUID for the request. 
    # + return - OK 
    remote isolated function deleteAccountSettingsExportByExportId(string organizationId, string exportId) returns json|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/exports/account_settings/${getEncodedUri(exportId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns the details and metadata for Bulk Account Settings Import requests in the organization.
    #
    # + organizationId - The organization ID Guid 
    # + return - OK 
    remote isolated function getOrganizationImportAccountSettingsRequests(string organizationId) returns OrganizationAccountSettingsImportResponse[]|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/account_settings`;
        OrganizationAccountSettingsImportResponse[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new account settings import request.
    #
    # + organizationId - The organization ID GUID. 
    # + payload - CSV file containing the account settings 
    # + return - OK 
    remote isolated function createImportAccountSettingsRequest(string organizationId, ImportsAccountSettingsBody payload) returns OrganizationAccountSettingsImportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/account_settings`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        OrganizationAccountSettingsImportResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the details/metadata for a Bulk Account Settings Import request.
    #
    # + organizationId - The organization ID Guid 
    # + importId - The import ID GUID for the request. 
    # + return - OK 
    remote isolated function getBulkAccountSettingsImportRequestById(string organizationId, string importId) returns OrganizationAccountSettingsImportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/account_settings/${getEncodedUri(importId)}`;
        OrganizationAccountSettingsImportResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a Bulk Account Settings Import request.
    #
    # + organizationId - The organization ID Guid 
    # + importId - The import ID GUID for the request. 
    # + return - OK 
    remote isolated function deleteAccountSettingsImportRequestById(string organizationId, string importId) returns json|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/account_settings/${getEncodedUri(importId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Creates a request to import new users into an account.
    #
    # + organizationId - The organization ID Guid 
    # + payload - The bulk user data as a CSV content 
    # + return - OK 
    remote isolated function createImportUsersRequest(string organizationId, BulkUsersAddBody payload) returns OrganizationImportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/bulk_users/add`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        OrganizationImportResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Import request for adding user to a single account within the organization.
    #
    # + organizationId - The organization ID Guid 
    # + accountId - The account ID Guid 
    # + payload - The bulk user data as a CSV content 
    # + return - OK 
    remote isolated function createImportSingleAccountUsersInsertRequest(string organizationId, string accountId, BulkUsersAddBody1 payload) returns OrganizationImportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/imports/bulk_users/add`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        OrganizationImportResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Bulk updates information for existing users.
    #
    # + organizationId - The organization ID Guid 
    # + payload - The bulk user data as a CSV content 
    # + return - OK 
    remote isolated function updateImportedUsers(string organizationId, BulkUsersUpdateBody payload) returns OrganizationImportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/bulk_users/update`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        OrganizationImportResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Import request for updating users for a single account
    # within the organization.
    #
    # + organizationId - The organization ID Guid 
    # + accountId - The account ID Guid 
    # + payload - The bulk user data as a CSV content 
    # + return - OK 
    remote isolated function updateSingleAccountUsersInOrganization(string organizationId, string accountId, BulkUsersUpdateBody1 payload) returns OrganizationImportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/imports/bulk_users/update`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        OrganizationImportResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates a request to close the accounts of existing users.
    #
    # + organizationId - The organization ID Guid 
    # + return - OK 
    remote isolated function createImportUsersAccountCloseRequest(string organizationId) returns OrganizationImportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/bulk_users/close`;
        http:Request request = new;
        //TODO: Update the request as needed;
        OrganizationImportResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Closes external memberships.
    #
    # + organizationId - The organization ID Guid 
    # + return - OK 
    remote isolated function closeExtenalMemberships(string organizationId) returns OrganizationImportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/bulk_users/close_external`;
        http:Request request = new;
        //TODO: Update the request as needed;
        OrganizationImportResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets a list of all of the user import requests.
    #
    # + organizationId - The organization ID Guid 
    # + return - OK 
    remote isolated function getImportUsersRequests(string organizationId) returns OrganizationImportsResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/bulk_users`;
        OrganizationImportsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the details of a single user import request.
    #
    # + organizationId - The organization ID Guid 
    # + importId - The import ID GUID for the request. 
    # + return - OK 
    remote isolated function getImportUserRequestById(string organizationId, string importId) returns OrganizationImportResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/bulk_users/${getEncodedUri(importId)}`;
        OrganizationImportResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a specific user import request.
    #
    # + organizationId - The organization ID Guid 
    # + importId - The import ID GUID for the request. 
    # + return - OK 
    remote isolated function deleteImportUserRequestById(string organizationId, string importId) returns json|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/bulk_users/${getEncodedUri(importId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Given the ID of a user import request,
    # return the CSV file that was imported.
    #
    # + organizationId - The organization ID Guid 
    # + importId - The import ID GUID for the request. 
    # + return - OK 
    remote isolated function getCsvResultsOfUserImportRequest(string organizationId, string importId) returns json|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/imports/bulk_users/${getEncodedUri(importId)}/results_csv`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the list of identity providers for an organization.
    #
    # + organizationId - The organization ID Guid 
    # + return - OK 
    remote isolated function getIdentityProvidersOfOrganization(string organizationId) returns IdentityProvidersResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/identity_providers`;
        IdentityProvidersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the list of reserved domains for the organization.
    #
    # + organizationId - The organization ID Guid 
    # + return - OK 
    remote isolated function getReservedDomainsOfOrganization(string organizationId) returns DomainsResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/reserved_domains`;
        DomainsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a user's information.
    #
    # + organizationId - The organization ID Guid 
    # + payload - A list of users whose information you want to change. 
    # + return - OK 
    remote isolated function updateUser(string organizationId, UpdateUsersRequest payload) returns UsersUpdateResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/users/profiles`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UsersUpdateResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates a user's email address.
    #
    # + organizationId - The organization ID Guid 
    # + payload - A change email request. 
    # + return - OK 
    remote isolated function upateUserEmailAddress(string organizationId, UpdateUsersEmailRequest payload) returns UsersUpdateResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/users/email_addresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UsersUpdateResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Closes a user's memberships.
    #
    # + organizationId - The organization ID Guid 
    # + userId - The user ID Guid 
    # + return - OK 
    remote isolated function closeUserMemberships(string organizationId, string userId) returns DeleteMembershipsResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/users/${getEncodedUri(userId)}/accounts`;
        DeleteMembershipsResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns information about the users in an organization.
    #
    # + organizationId - The organization ID Guid 
    # + 'start - Index of first item to include in the response. The default value is 0. 
    # + take - Page size of the response. The default value is 20. 
    # + end - Index of the last item to include in the response. Ignored if `take` parameter is specified. 
    # + email - Email address of the desired user. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified. 
    # + emailUserNameLike - Selects users by pattern matching on the user's email address 
    # + status - Status. 
    # + membershipStatus - The user's membership status. One of: - `activation_required` - `activation_sent` - `active` - `closed` - `disabled` 
    # + accountId - Select users that are members of the specified account. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified. 
    # + organizationReservedDomainId - Select users that are in the specified domain. At least one of `email`, `account_id` or `organization_reserved_domain_id` must be specified. 
    # + lastModifiedSince - Select users whose data have been modified since the date specified. `account_id` or `organization_reserved_domain_id` must be specified. 
    # + return - OK 
    remote isolated function getUsersInOrganization(string organizationId, int? 'start = (), int? take = (), int? end = (), string? email = (), string? emailUserNameLike = (), string? status = (), string? membershipStatus = (), string? accountId = (), string? organizationReservedDomainId = (), string? lastModifiedSince = ()) returns OrganizationUsersResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/users`;
        map<anydata> queryParam = {"start": 'start, "take": take, "end": end, "email": email, "email_user_name_like": emailUserNameLike, "status": status, "membership_status": membershipStatus, "account_id": accountId, "organization_reserved_domain_id": organizationReservedDomainId, "last_modified_since": lastModifiedSince};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OrganizationUsersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new user.
    #
    # + organizationId - The organization ID Guid 
    # + payload - Information about a new user. 
    # + return - OK 
    remote isolated function createUser(string organizationId, NewUserRequest payload) returns NewUserResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NewUserResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Activates user memberships.
    #
    # + organizationId - The organization ID Guid 
    # + userId - The user ID Guid 
    # + membershipId - The membership ID GUID. 
    # + payload - Data to ctivate user memership 
    # + return - OK 
    remote isolated function activateUserMembership(string organizationId, string userId, string membershipId, ForceActivateMembershipRequest payload) returns UpdateResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/users/${getEncodedUri(userId)}/memberships/${getEncodedUri(membershipId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns information about recently modified users.
    #
    # + organizationId - The organization ID Guid 
    # + email - The email address associated with the users you want to retrieve. 
    # + return - OK 
    remote isolated function getRecentlyModifiedUsers(string organizationId, string? email = ()) returns UsersDrilldownResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/users/profile`;
        map<anydata> queryParam = {"email": email};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UsersDrilldownResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes user identities.
    #
    # + organizationId - The organization ID Guid 
    # + userId - The user ID Guid 
    # + return - OK 
    remote isolated function deleteUserIdentities(string organizationId, string userId) returns DeleteResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/users/${getEncodedUri(userId)}/identities`;
        DeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Adds users to an account.
    #
    # + organizationId - The organization ID Guid 
    # + accountId - The account ID Guid 
    # + payload - A new user request. 
    # + return - OK 
    remote isolated function createAccountUsers(string organizationId, string accountId, NewAccountUserRequest payload) returns NewUserResponse|error {
        string resourcePath = string `/v2/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NewUserResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of DSGroups.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + page - Start page of DSGroups. 
    # + pageSize - Page size of DSGroups. 
    # + return - OK 
    remote isolated function getDsGroups(string organizationId, string accountId, int? page = (), int? pageSize = ()) returns DSGroupListResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/dsgroups`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DSGroupListResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new DSGroup.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + payload - DS Group add data 
    # + return - OK 
    remote isolated function createDsGroup(string organizationId, string accountId, DSGroupAddRequest payload) returns DSGroupResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/dsgroups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DSGroupResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns details about a single DSGroup.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + dsGroupId - The DSGroup's ID GUID 
    # + return - OK 
    remote isolated function getDsGroup(string organizationId, string accountId, string dsGroupId) returns DSGroupResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/dsgroups/${getEncodedUri(dsGroupId)}`;
        DSGroupResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a DSGroup.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + dsGroupId - The DSGroup's GUID. 
    # + return - No Content 
    remote isolated function deleteDsGroup(string organizationId, string accountId, string dsGroupId) returns http:Response|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/dsgroups/${getEncodedUri(dsGroupId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a list of users in a DSGroup.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + dsGroupId - The DSGroup's GUID. 
    # + page - Start page of DSGroups. 
    # + pageSize - Page size of DSGroups. 
    # + return - OK 
    remote isolated function getDsGroupUsers(string organizationId, string accountId, string dsGroupId, int? page = (), int? pageSize = ()) returns DSGroupAndUsersResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/dsgroups/${getEncodedUri(dsGroupId)}/users`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DSGroupAndUsersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a list of users to a DSGroup.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + dsGroupId - The DSGroup's GUID. 
    # + payload - DG Group user data 
    # + return - OK 
    remote isolated function addDsGroupUsers(string organizationId, string accountId, string dsGroupId, DSGroupUsersAddRequest payload) returns AddDSGroupAndUsersResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/dsgroups/${getEncodedUri(dsGroupId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddDSGroupAndUsersResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Removes a list of users from a DSGroup.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + dsGroupId - The DSGroup's GUID. 
    # + return - OK 
    remote isolated function removeDsGroupUsers(string organizationId, string accountId, string dsGroupId) returns RemoveDSGroupUsersResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/dsgroups/${getEncodedUri(dsGroupId)}/users`;
        RemoveDSGroupUsersResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets products associated with the account and the available permission profiles.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + return - OK 
    remote isolated function getProductPermissionProfiles(string organizationId, string accountId) returns ProductPermissionProfilesResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/products/permission_profiles`;
        ProductPermissionProfilesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a list of user's permission profiles for each account's product.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + userId - The user ID GUID. 
    # + return - OK 
    remote isolated function getUserProductPermissionProfilesOfProduct(string organizationId, string accountId, string userId) returns ProductPermissionProfilesResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/products/users/${getEncodedUri(userId)}/permission_profiles`;
        ProductPermissionProfilesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assigns user to permission profiles for one or more products.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + userId - The user ID GUID. 
    # + payload - Product permission profile data 
    # + return - OK 
    remote isolated function assignUserToProductPermissionProfiles(string organizationId, string accountId, string userId, ProductPermissionProfilesRequest payload) returns UserProductPermissionProfilesResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/products/users/${getEncodedUri(userId)}/permission_profiles`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserProductPermissionProfilesResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates and updates a multi-product user.
    #
    # + organizationId - The organization's GUID. 
    # + accountId - The account ID GUID. 
    # + payload - Multi product user data 
    # + return - OK 
    remote isolated function createOrUpdateMultiProductUsers(string organizationId, string accountId, NewMultiProductUserAddRequest payload) returns AddUserResponse|error {
        string resourcePath = string `/v2.1/organizations/${getEncodedUri(organizationId)}/accounts/${getEncodedUri(accountId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddUserResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
