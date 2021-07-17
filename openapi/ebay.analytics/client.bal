// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# The <i>Analytics API</i> provides data and information about a seller and their eBay business.  <br><br>The resources and methods in this API let sellers review information on their listing performance, metrics on their customer service performance, and details on their eBay seller performance rating.  <br><br>The three resources in the Analytics API provide the following data and information: <ul><li><b>Customer Service Metric</b> &ndash; Returns data on a seller's customer service performance as compared to other seller's in the same peer group.</li> <li><b>Traffic Report</b> &ndash; Returns data that shows how buyers are engaging with a seller's listings.</li> <li><b>Seller Standards Profile</b> &ndash; Returns data pertaining to a seller's performance rating.</li></ul> Sellers can use the data and information returned by the various Analytics API methods to determine where they can make improvements to increase sales and how they might improve their seller status as viewed by eBay buyers.  <br><br>For details on using this API, see <a href="/api-docs/sell/static/performance/analyzing-performance.html" title="Selling Integration Guide">Analyzing seller performance</a>.
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.ebay.com/sell/analytics/v1") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    #
    # + customer_service_metric_type - Use this path parameter to specify the type of customer service metrics and benchmark data you want returned for the seller. Supported types are: ITEM_NOT_AS_DESCRIBED ITEM_NOT_RECEIVED
    # + evaluationMarketplaceId - Use this query parameter to specify the Marketplace ID to evaluate for the customer service metrics and benchmark data. For the list of supported marketplaces, see Analytics API requirements and restrictions. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/analytics/types/bas:MarketplaceIdEnum
    # + evaluation_type - Use this path parameter to specify the type of the seller evaluation you want returned, either: CURRENT &ndash; A monthly evaluation that occurs on the 20th of every month. PROJECTED &ndash; A daily evaluation that provides a projection of how the seller is currently performing with regards to the upcoming evaluation period.
    # + return - Success
    remote isolated function getCustomerServiceMetric(string customer_service_metric_type, string evaluationMarketplaceId, string evaluation_type) returns GetCustomerServiceMetricResponse|error {
        string  path = string `/customer_service_metric/${customer_service_metric_type}/${evaluation_type}`;
        map<anydata> queryParam = {"evaluation_marketplace_id": evaluationMarketplaceId};
        path = path + check getPathForQueryParam(queryParam);
        GetCustomerServiceMetricResponse response = check self.clientEp-> get(path, targetType = GetCustomerServiceMetricResponse);
        return response;
    }
    #
    # + return - Success
    remote isolated function findSellerStandardsProfiles() returns FindSellerStandardsProfilesResponse|error {
        string  path = string `/seller_standards_profile`;
        FindSellerStandardsProfilesResponse response = check self.clientEp-> get(path, targetType = FindSellerStandardsProfilesResponse);
        return response;
    }
    #
    # + cycle - The period covered by the returned standards profile evaluation. Supply one of two values, CURRENT means the response reflects eBay's most recent monthly standards evaluation and PROJECTED means the response reflect the seller's projected monthly evaluation, as calculated at the time of the request.
    # + program - This input value specifies the region used to determine the seller's standards profile. Supply one of the four following values, PROGRAM_DE, PROGRAM_UK, PROGRAM_US, or PROGRAM_GLOBAL.
    # + return - Success
    remote isolated function getSellerStandardsProfile(string cycle, string program) returns StandardsProfile|error {
        string  path = string `/seller_standards_profile/${program}/${cycle}`;
        StandardsProfile response = check self.clientEp-> get(path, targetType = StandardsProfile);
        return response;
    }
    #
    # + dimension - This query parameter specifies the dimension, or &quot;attribute,&quot; that is applied to the report metric. Valid values: DAY or LISTING Examples If you specify dimension=DAY and metric=CLICK_THROUGH_RATE, the traffic report contains the number of times an item displayed on a search results page and the buyer clicked through to the View Item page for each day in the date range, as in: 12-06-17: 32, 12-07-17: 54, ... If you specify dimension=LISTING and metric=LISTING_IMPRESSION_STORE, the traffic report contains the number of times that listing appeared on the seller's store during the specified date range. For example, LISTING_IMPRESSION_STORE: 157 means the item appeared 157 times in the store during the date range.
    # + filter - This query parameter refines the information returned in the traffic report. Configure the following properties of the filter parameter to tune the traffic report to your needs: date_range Limits the report to the specified range of dates. Format the date range by enclosing the earliest date and end date for the report in brackets (&quot;[ ]&quot;), as follows: [YYYYMMDD..YYYYMMDD] The maximum range between the start and end dates is 90 days, and the earliest start date you can specify is two years prior to the current date, which is defined as 730 days (365 * 2), not accounting for Leap Year. The last date for which traffic data exists is a value called lastUpdatedDate. eBay returns an error if you specify a date range greater than 90 days, or the start date is after the lastUpdatedDate. If the specified end date is beyond the lastUpdatedDate, eBay returns data up to the lastUpdatedDate. Required: Always listing_ids This filter limits the results to only the supplied list of listingId values. You can specify to 200 different listingId values. Enclose the list of IDs with curly braces (&quot;{ }&quot;), and separate multiple values with a pipe character (&quot;|&quot;). This filter only returns data for listings that have been either active or sold in last 90 days, and any unsold listings in the last 30 days. All listings must be the seller's and they must be listed on the marketplace specified by the marketplace_ids filter argument. marketplace_ids This filter limits the report to seller data related to only the specified marketplace ID (currently the filter allows only a single marketplace ID). Enclose the marketplace ID in curly braces (&quot;{ }&quot;). Valid values: EBAY_AU EBAY_DE EBAY_GB EBAY_US EBAY_MOTORS Required if you set the dimension parameter to DAY. traffic_source Limits the report to either Promoted Listings items or non-Promoted Listings (organic) items. Valid values are ORGANIC and PROMOTED_LISTINGS. Enclose the list of values with curly braces (&quot;{ }&quot;), and separate multiple values with a pipe character (&quot;|&quot;) The default is both values. Example filter parameter The following example shows how to configure the filter parameter with the marketplace_ids and date_range filters: filter=marketplace_ids:{EBAY_US},date_range:[20170601..20170828] Note: You must URL encode all the values you supply in the filter parameter, as described in URL parameters. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/analytics/types/csb:FilterField
    # + metric - This query parameter specifies the metrics you want covered in the report. Specify a comma-separated list of the metrics you want included in the report. Valid values: CLICK_THROUGH_RATE The number of times an item displays on the search results page divided by the number of times buyers clicked through to its View Item page. Localized name: Click through rate LISTING_IMPRESSION_SEARCH_RESULTS_PAGE The number of times the seller's listings displayed on the search results page. Note, the listing might not have been visible to the buyer due to its position on the page. Localized name: Listing impressions from the search results page LISTING_IMPRESSION_STORE The number of times the seller's listings displayed on the seller's store. Note, the listing might not have been visible to the buyer due to its position on the page. Localized name: Listing impressions from your Store LISTING_IMPRESSION_TOTAL The total number of times the seller's listings displayed on the search results page OR in the seller's store. The item is counted each time it displays on either page. However, the listing might not have been visible to the buyer due to its position on the page. This is a combination of: LISTING_IMPRESSION_SEARCH_RESULTS_PAGE + LISTING_IMPRESSION_STORE. Localized name: Total listing impressions LISTING_VIEWS_SOURCE_DIRECT The number of times a View Item page was directly accessed, such as when a buyer navigates to the page using a bookmark. Localized name: Direct views LISTING_VIEWS_SOURCE_OFF_EBAY The number of times a View Item page was accessed via a site other than eBay, such as when a buyer clicks on a link to the listing from a search engine page. Localized name: Off eBay views LISTING_VIEWS_SOURCE_OTHER_EBAY The number of times a View Item page was accessed from an eBay page that is not either the search results page or the seller's store. Localized name: Views from non-search and non-store pages within eBay LISTING_VIEWS_SOURCE_SEARCH_RESULTS_PAGE The number of times the item displayed on the search results page. Localized name: Views on the search results page LISTING_VIEWS_SOURCE_STORE The number of times a View Item page was accessed via the seller's store. Localized name: Views from your Store LISTING_VIEWS_TOTAL Total number of listings viewed. This number sums: LISTING_VIEWS_SOURCE_DIRECT LISTING_VIEWS_SOURCE_OFF_EBAY LISTING_VIEWS_SOURCE_OTHER_EBAY LISTING_VIEWS_SOURCE_SEARCH_RESULTS_PAGE LISTING_VIEWS_SOURCE_STORE. Localized name: Total views SALES_CONVERSION_RATE The number of completed transactions divided by the number of View Item page views. Equals: TRANSACTION / LISTING_VIEWS_TOTAL Localized name: Sales conversion rate TRANSACTION The total number of completed transactions. Localized name: Transaction count
    # + sort - This query parameter sorts the report on the specified metric. The metric you specify must be included in the configuration of the report's metric parameter. Sorting is helpful when you want to review how a specific metric is performing, such as the CLICK_THROUGH_RATE. Reports can be sorted in ascending or descending order. Precede the value of a descending-order request with a minus sign (&quot;-&quot;), for example: sort=-CLICK_THROUGH_RATE. For implementation help, refer to eBay API documentation at https://developer.ebay.com/api-docs/sell/analytics/types/csb:SortField
    # + return - Success
    remote isolated function getTrafficReport(string? dimension = (), string? filter = (), string? metric = (), string? sort = ()) returns Report|error {
        string  path = string `/traffic_report`;
        map<anydata> queryParam = {"dimension": dimension, "filter": filter, "metric": metric, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Report response = check self.clientEp-> get(path, targetType = Report);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
