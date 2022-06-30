package com.zacz.twitch.external.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public record Clip(
        String id,
        String url,
        @JsonProperty("embed_url") String embedUrl,
        @JsonProperty("broacaster_id") String broacasterId,
        @JsonProperty("broacaster_name") String broacasterName,
        @JsonProperty("creator_id") String creatorId,
        @JsonProperty("language") String language,
        @JsonProperty("title") String title,
        @JsonProperty("duration") Float duration){
}