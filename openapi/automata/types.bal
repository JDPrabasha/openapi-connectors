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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # All Automata API endpoints require an API key distributed by Automata. Retrieve an API key at https://apis.byautomata.io for the /similar and /search endpoints. The ContentPro API endpoints are not included in the standard Market Intelligence API plans. Contact support@byautomata.io for access.
    @display {label: "", kind: "password"}
    string xApiKey;
|};

public type SimilarCompanySearch record {
    string companyName?;
    string website?;
    string employee?;
    string industry?;
    string description?;
    string title?;
    string linkedin?;
    string twitter?;
    Snippet[] snippets?;
};

public type SimilarCompany record {
    string companyName?;
    string website?;
    string employee?;
    string industry?;
    string description?;
    string title?;
    string linkedin?;
    string twitter?;
};

public type ContentProSnippets record {
    string[] description?;
    string[] text?;
    string[] title?;
};

public type Article record {
    string title?;
    string pubdate?;
    string link?;
};

public type SimilarCompanyResponse record {
    SimilarCompany[] companies?;
    InputCompany input_company?;
    string count_remaining?;
    string calls_per_month?;
    string renewal_date?;
};

public type SimilarTextResponse record {
    SimilartextresponseData[] data?;
    string count_remaining?;
    string calls_per_month?;
    string renewal_date?;
};

public type Snippet record {
    string[] description?;
    string[] text?;
    string[] title?;
};

public type ContentProCompany record {
    string companyName?;
    string website?;
    string employee?;
    string industry?;
    string description?;
    string linkedin?;
    string twitter?;
};

public type ContentSearchResponse record {
    SimilartextresponseData[] data?;
    string count_remaining?;
    string calls_per_month?;
    string renewal_date?;
};

public type InputCompany record {
    string companyName?;
    string country?;
    string website?;
    string employee?;
    string industry?;
    string linkedin?;
    string twitter?;
};

public type SearchResponse record {
    SimilarCompanySearch[] companies?;
    string count_remaining?;
    string calls_per_month?;
    string renewal_date?;
};

public type SimilartextresponseData record {
    Article article?;
    ContentProCompany company?;
    ContentProSnippets snippets?;
};
