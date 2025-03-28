package com.spring.backend.travel;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DestinationService {
    private final DestinationRepository destinationRepository;

    public List<Destination> getAllDestination(){
        return destinationRepository.findAll();
    }

    public Destination addDestination(DestinationCreate request){
        return Destination.builder()
                .name(request.getName())
                .image(request.getImage())
                .rating(request.getRating())
                .build();

    }

}
