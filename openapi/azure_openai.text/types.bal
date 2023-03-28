// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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
    # Provides Auth configurations needed when communicating with a remote HTTP endpoint.
    http:BearerTokenConfig|ApiKeysConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # The key used to access the OpenAI APIs
    @display {label: "", kind: "password"}
    string apiKey;
|};

public type ErrorResponse_error record {
    string code?;
    string message?;
    string param?;
    string 'type?;
};

public type Inline_response_200_usage record {
    int completion_tokens;
    int prompt_tokens;
    int total_tokens;
};

public type Inline_response_200_logprobs record {
    string[] tokens?;
    decimal[] token_logprobs?;
    record {||}[] top_logprobs?;
    int[] text_offset?;
};

public type Inline_response_200_choices record {
    string text?;
    int index?;
    Inline_response_200_logprobs? logprobs?;
    string finish_reason?;
};

public type Deploymentid_completions_body record {
    # The prompt(s) to generate completions for, encoded as a string or array of strings.
    # Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document. Maximum allowed size of string list is 2048.
    string|string[]? prompt?;
    # The token count of your prompt plus max_tokens cannot exceed the model's context length. Most models have a context length of 2048 tokens (except for the newest models, which support 4096). Has minimum of 0.
    int? max_tokens?;
    # What sampling temperature to use. Higher values means the model will take more risks. Try 0.9 for more creative applications, and 0 (argmax sampling) for ones with a well-defined answer.
    # We generally recommend altering this or top_p but not both.
    decimal? temperature?;
    # An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    # We generally recommend altering this or temperature but not both.
    decimal? top_p?;
    # Defaults to null. Modify the likelihood of specified tokens appearing in the completion. Accepts a json object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this tokenizer tool (which works for both GPT-2 and GPT-3) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token. As an example, you can pass {"50256" &#58; -100} to prevent the <|endoftext|> token from being generated.
    record {} logit_bias?;
    # A unique identifier representing your end-user, which can help monitoring and detecting abuse
    string user?;
    # How many completions to generate for each prompt. Minimum of 1 and maximum of 128 allowed.
    # Note: Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for max_tokens and stop.
    int? n?;
    # Whether to stream back partial progress. If set, tokens will be sent as data-only server-sent events as they become available, with the stream terminated by a data: [DONE] message.
    boolean? 'stream?;
    # Include the log probabilities on the logprobs most likely tokens, as well the chosen tokens. For example, if logprobs is 5, the API will return a list of the 5 most likely tokens. The API will always return the logprob of the sampled token, so there may be up to logprobs+1 elements in the response.
    # Minimum of 0 and maximum of 5 allowed.
    int? logprobs?;
    # ID of the model to use. You can use the Models_List operation to see all of your available models, or see our Models_Get overview for descriptions of them.
    string? model?;
    # The suffix that comes after a completion of inserted text.
    string? suffix?;
    # Echo back the prompt in addition to the completion
    boolean? echo?;
    # Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
    string|string[]? stop?;
    string? completion_config?;
    # can be used to disable any server-side caching, 0=no cache, 1=prompt prefix enabled, 2=full cache
    int? cache_level?;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    decimal presence_penalty?;
    # Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
    decimal frequency_penalty?;
    # Generates best_of completions server-side and returns the "best" (the one with the highest log probability per token). Results cannot be streamed.
    # When used with n, best_of controls the number of candidate completions and n specifies how many to return – best_of must be greater than n.
    # Note: Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for max_tokens and stop. Has maximum value of 128.
    int best_of?;
};

public type Inline_response_200 record {
    string id;
    string 'object;
    int created;
    string model;
    Inline_response_200_choices[] choices;
    Inline_response_200_usage usage?;
};

public type ErrorResponse record {
    ErrorResponse_error 'error?;
};
