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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-IBM-Client-Id`
    string xIbmClientId;
|};

# This is a generated connector for [Apptigent PowerTools Developer API v2021.3.01](https://portal.apptigent.com/node/904) OpenAPI specification.
# 'Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
# Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
# PowerTools is the ultimate developer toolkit.'
# This connector provides the capability for weather conditions, forecasts and related operations.
@display {label: "PowerTools Developer Weather", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Apptigent account](https://portal.apptigent.com/user/register) and obtain tokens by following [this guide](https://portal.apptigent.com/start).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://connect.apptigent.com/api/utilities") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Collections - Add to collection
    #
    # + payload - Collection modification parameters 
    # + return - OK 
    remote isolated function addToCollection(InputCollectionModify payload) returns OutputCollectionResult|error {
        string resourcePath = string `/AddToCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputCollectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Remove from collection
    #
    # + payload - Collection modification parameters 
    # + return - OK 
    remote isolated function removeFromCollection(InputCollectionModify payload) returns OutputCollectionResult|error {
        string resourcePath = string `/RemoveFromCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputCollectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Filter collection
    #
    # + payload - Filter collection parameters 
    # + return - OK 
    remote isolated function filterCollection(InputCollectionFilter payload) returns OutputCollectionResult|error {
        string resourcePath = string `/FilterCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputCollectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Sort collection
    #
    # + payload - Sort collection parameters 
    # + return - OK 
    remote isolated function sortCollection(InputCollectionSort payload) returns OutputCollectionResult|error {
        string resourcePath = string `/SortCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputCollectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Count collection
    #
    # + payload - Count collection parameters 
    # + return - OK 
    remote isolated function countCollection(InputCollectionCount payload) returns OutputNumber|error {
        string resourcePath = string `/CountCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Split collection
    #
    # + payload - Split collection parameters 
    # + return - OK 
    remote isolated function splitCollection(InputCollectionSplit payload) returns OutputMultiCollection|error {
        string resourcePath = string `/SplitCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputMultiCollection response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Replace values in collection
    #
    # + payload - Replace values in collection parameters 
    # + return - OK 
    remote isolated function replaceValuesInCollection(InputCollectionReplace payload) returns OutputCollectionResult|error {
        string resourcePath = string `/ReplaceValuesInCollection`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputCollectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Contains string
    #
    # + payload - Collection search parameters 
    # + return - OK 
    remote isolated function collectionContainsString(InputCollectionSearch payload) returns OutputCollectionString|error {
        string resourcePath = string `/CollectionContainsString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputCollectionString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Starts with string
    #
    # + payload - Collection search parameters 
    # + return - OK 
    remote isolated function collectionStartsWithString(InputCollectionSearch payload) returns OutputCollectionString|error {
        string resourcePath = string `/CollectionStartsWithString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputCollectionString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Ends with string
    #
    # + payload - Collection search parameters 
    # + return - OK 
    remote isolated function collectionEndsWithString(InputCollectionSearch payload) returns OutputCollectionString|error {
        string resourcePath = string `/CollectionEndsWithString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputCollectionString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Contains number
    #
    # + payload - Collection search parameters 
    # + return - OK 
    remote isolated function collectionContainsNumber(InputCollectionSearchNumeric payload) returns OutputCollectionNumber|error {
        string resourcePath = string `/CollectionContainsNumber`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputCollectionNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Collection to JSON
    #
    # + return - OK 
    remote isolated function collectionToJSON(InputCollectionConversion payload) returns OutputString|error {
        string resourcePath = string `/CollectionToJSON`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Collections - Collection to XML
    #
    # + return - OK 
    remote isolated function collectionToXml(InputCollectionConversionXML payload) returns OutputString|error {
        string resourcePath = string `/CollectionToXML`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Currency - Convert currency
    #
    # + return - OK 
    remote isolated function convertCurrency(InputCurrencyConversion payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertCurrency`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Currency - Format currency
    #
    # + return - OK 
    remote isolated function formatCurrency(InputCurrencyFormat payload) returns OutputString|error {
        string resourcePath = string `/FormatCurrency`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Finance - Stock prices
    #
    # + return - OK 
    remote isolated function stockPrices(InputStockPrices payload) returns OutputStockPrice|error {
        string resourcePath = string `/StockPrices`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputStockPrice response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Finance - Market index
    #
    # + return - OK 
    remote isolated function marketIndex(InputMarketIndex payload) returns OutputMarketIndex|error {
        string resourcePath = string `/MarketIndex`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputMarketIndex response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # DateTime - Get date and time information
    #
    # + return - OK 
    remote isolated function dateTimeInfo(InputDateTimeInfo payload) returns OutputDateInfo|error {
        string resourcePath = string `/DateTimeInfo`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputDateInfo response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # DateTime - DateTime difference
    #
    # + return - OK 
    remote isolated function dateTimeDifference(InputDateTimeDifference payload) returns OutputDateDifference|error {
        string resourcePath = string `/DateTimeDifference`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputDateDifference response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # DateTime - Format date and time
    #
    # + return - OK 
    remote isolated function formatDateTime(InputDateTimeFormat payload) returns OutputString|error {
        string resourcePath = string `/FormatDateTime`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # DateTime - Get world time
    #
    # + return - OK 
    remote isolated function worldTime(InputDateTimeConversion payload) returns OutputString|error {
        string resourcePath = string `/WorldTime`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate average
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateAverage(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateAverage`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate median
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateMedian(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateMedian`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate minimum or maximum
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateMinMax(InputCalculateMinMax payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateMinMax`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate sum
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateSum(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateSum`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate power
    #
    # + payload - Power calculation parameters 
    # + return - OK 
    remote isolated function calculatePower(InputCalculatePower payload) returns OutputNumber|error {
        string resourcePath = string `/CalculatePower`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate variance
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function calculateVariance(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateVariance`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Addition
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateAddition(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateAddition`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Subtraction
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateSubtraction(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateSubtraction`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Multiplication
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateMultiplication(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateMultiplication`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Division
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateDivision(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateDivision`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Modulo
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateModulo(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateModulo`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Nth Root
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateNthRoot(InputCalculateNumbers payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateNthRoot`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Square Root
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateSquareRoot(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateSquareRoot`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Logarithm
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateLogarithm(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateLogarithm`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Sine
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateSine(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateSine`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Cosine
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateCosine(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateCosine`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Tangent
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateTangent(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateTangent`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate Absolute
    #
    # + payload - Number calculation parameters 
    # + return - OK 
    remote isolated function calculateAbsolute(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/CalculateAbsolute`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert angle
    #
    # + return - OK 
    remote isolated function convertAngle(InputConvertAngle payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertAngle`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert area
    #
    # + return - OK 
    remote isolated function convertArea(InputConvertArea payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertArea`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert distance
    #
    # + return - OK 
    remote isolated function convertDistance(InputConvertDistance payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertDistance`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert duration
    #
    # + return - OK 
    remote isolated function convertDuration(InputConvertDuration payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertDuration`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert energy
    #
    # + return - OK 
    remote isolated function convertEnergy(InputConvertEnergy payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertEnergy`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert power
    #
    # + return - OK 
    remote isolated function convertPower(InputConvertPower payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertPower`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert speed
    #
    # + return - OK 
    remote isolated function convertSpeed(InputConvertSpeed payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertSpeed`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert temperature
    #
    # + return - OK 
    remote isolated function convertTemperature(InputConvertTemperature payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertTemperature`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert volume
    #
    # + return - OK 
    remote isolated function convertVolume(InputConvertVolume payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertVolume`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Convert weight
    #
    # + return - OK 
    remote isolated function convertWeight(InputConvertWeight payload) returns OutputNumber|error {
        string resourcePath = string `/ConvertWeight`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Random number
    #
    # + return - OK 
    remote isolated function randomNumber(InputNumberRange payload) returns OutputNumber|error {
        string resourcePath = string `/RandomNumber`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Round number
    #
    # + payload - Numeric calculation parameters 
    # + return - OK 
    remote isolated function roundNumber(InputCalculateNumber payload) returns OutputNumber|error {
        string resourcePath = string `/RoundNumber`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Math - Calculate standard deviation
    #
    # + payload - Series calculation parameters 
    # + return - OK 
    remote isolated function standardDeviation(InputCalculateSeries payload) returns OutputNumber|error {
        string resourcePath = string `/StandardDeviation`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Compare strings
    #
    # + return - OK 
    remote isolated function compareStrings(InputStringComparison payload) returns OutputString|error {
        string resourcePath = string `/CompareStrings`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Contains string
    #
    # + return - OK 
    remote isolated function containsString(InputStringContains payload) returns OutputString|error {
        string resourcePath = string `/ContainsString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Convert case
    #
    # + return - OK 
    remote isolated function convertCase(InputCaseConversion payload) returns OutputString|error {
        string resourcePath = string `/ConvertCase`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Decode string
    #
    # + return - OK 
    remote isolated function decodeString(DecodestringBody payload) returns OutputString|error {
        string resourcePath = string `/DecodeString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Encode string
    #
    # + return - OK 
    remote isolated function encodeString(InputString payload) returns OutputString|error {
        string resourcePath = string `/EncodeString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Generate GUID
    #
    # + return - OK 
    remote isolated function generateGuid(InputGenerateUniqueID payload) returns OutputString|error {
        string resourcePath = string `/GenerateGuid`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Generate password
    #
    # + return - OK 
    remote isolated function generatePassword(InputGeneratePassword payload) returns OutputString|error {
        string resourcePath = string `/GeneratePassword`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Generate hash
    #
    # + return - OK 
    remote isolated function generateHash(InputGenerateHash payload) returns OutputString|error {
        string resourcePath = string `/GenerateHash`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Verify hash
    #
    # + return - OK 
    remote isolated function verifyHash(InputVerifyHash payload) returns OutputBoolean|error {
        string resourcePath = string `/VerifyHash`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputBoolean response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Join strings
    #
    # + return - OK 
    remote isolated function joinStrings(InputJoinStrings payload) returns OutputString|error {
        string resourcePath = string `/JoinStrings`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Redact string
    #
    # + return - OK 
    remote isolated function redactString(InputRedactString payload) returns OutputString|error {
        string resourcePath = string `/RedactString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Replace string
    #
    # + return - OK 
    remote isolated function replaceString(InputReplaceString payload) returns OutputString|error {
        string resourcePath = string `/ReplaceString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Shorten hyperlink
    #
    # + return - OK 
    remote isolated function shortenLink(ShortenlinkBody payload) returns OutputString|error {
        string resourcePath = string `/ShortenLink`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Split string
    #
    # + return - OK 
    remote isolated function splitString(InputSplitString payload) returns OutputStringArray|error {
        string resourcePath = string `/SplitString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputStringArray response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Text to Speech
    #
    # + return - OK 
    remote isolated function textToSpeech(InputTextToSpeech payload) returns string|error {
        string resourcePath = string `/TextToSpeech`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Translate string
    #
    # + return - OK 
    remote isolated function translateString(InputTranslateString payload) returns OutputString|error {
        string resourcePath = string `/TranslateString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Trim string
    #
    # + return - OK 
    remote isolated function trimString(InputTrimString payload) returns OutputString|error {
        string resourcePath = string `/TrimString`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Decode URL
    #
    # + return - OK 
    remote isolated function urlDecode(UrldecodeBody payload) returns OutputString|error {
        string resourcePath = string `/URLDecode`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Encode URL
    #
    # + return - OK 
    remote isolated function urlEncode(InputString payload) returns OutputString|error {
        string resourcePath = string `/URLEncode`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - Validate email
    #
    # + return - OK 
    remote isolated function validateEmail(ValidateemailBody payload) returns OutputString|error {
        string resourcePath = string `/ValidateEmail`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - JSON to HTML Table
    #
    # + return - OK 
    remote isolated function jsonToHtml(InputJsonConversionHTML payload) returns OutputString|error {
        string resourcePath = string `/JSONtoHTML`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - JSON to CSV
    #
    # + return - OK 
    remote isolated function jsonToCsv(InputJsonConversionCSV payload) returns OutputString|error {
        string resourcePath = string `/JSONtoCSV`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - JSON to XML
    #
    # + return - OK 
    remote isolated function jsonToXml(InputJsonConversionXML payload) returns OutputString|error {
        string resourcePath = string `/JSONtoXML`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - CSV to JSON
    #
    # + return - OK 
    remote isolated function csvToJson(InputCsvConversionJSON payload) returns OutputString|error {
        string resourcePath = string `/CSVtoJSON`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - XML to JSON
    #
    # + return - OK 
    remote isolated function xmlToJson(InputXmlConversionJSON payload) returns OutputString|error {
        string resourcePath = string `/XMLtoJSON`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - Query JSON
    #
    # + return - OK 
    remote isolated function queryJson(InputDataQuery payload) returns OutputString|error {
        string resourcePath = string `/QueryJSON`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Data - Query XML
    #
    # + return - OK 
    remote isolated function queryXml(InputDataQuery payload) returns OutputString|error {
        string resourcePath = string `/QueryXML`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Files - Generate QR code
    #
    # + return - OK 
    remote isolated function generateQRCode(InputQRCode payload) returns string|error {
        string resourcePath = string `/GenerateQRCode`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Text - String to File
    #
    # + return - OK 
    remote isolated function stringToFile(InputStringToFile payload) returns string|error {
        string resourcePath = string `/StringToFile`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Maps - IP Location
    #
    # + return - OK 
    remote isolated function iPLocation(IplocationBody payload) returns OutputIPLocation|error {
        string resourcePath = string `/IPLocation`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputIPLocation response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Maps - Map Coordinates
    #
    # + return - OK 
    remote isolated function mapCoordinates(MapcoordinatesBody payload) returns OutputMapCoordinates|error {
        string resourcePath = string `/MapCoordinates`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputMapCoordinates response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Maps - Map Image
    #
    # + return - OK 
    remote isolated function mapImage(InputMapImage payload) returns string|error {
        string resourcePath = string `/MapImage`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Maps - Map Timezone
    #
    # + return - OK 
    remote isolated function mapTimezone(MaptimezoneBody payload) returns OutputTimezoneInfo|error {
        string resourcePath = string `/MapTimezone`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputTimezoneInfo response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Weather - Weather Conditions
    #
    # + payload - Input weather conditions 
    # + return - OK 
    remote isolated function weatherConditions(InputWeatherConditions payload) returns OutputWeatherConditions|error {
        string resourcePath = string `/WeatherConditions`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputWeatherConditions response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Weather - Daily Forecast
    #
    # + payload - Input weather daily forecast 
    # + return - OK 
    remote isolated function weatherDailyForecast(InputWeatherDailyForecast payload) returns OutputDailyForecast|error {
        string resourcePath = string `/WeatherDailyForecast`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputDailyForecast response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Weather - Hourly Forecast
    #
    # + payload - Input weather hourly forecast 
    # + return - OK 
    remote isolated function weatherHourlyForecast(InputWeatherHourlyForecast payload) returns OutputHourlyForecast|error {
        string resourcePath = string `/WeatherHourlyForecast`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputHourlyForecast response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Weather - Activity Forecast
    #
    # + payload - Input weather activity forecast 
    # + return - OK 
    remote isolated function weatherActivityForecast(InputWeatherActivityForecast payload) returns OutputActivityForecast|error {
        string resourcePath = string `/WeatherActivityForecast`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputActivityForecast response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
