package com.spring.backend.travel;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DestinationCreate {
    private String name;
    private String image;
    private int rating;
}
