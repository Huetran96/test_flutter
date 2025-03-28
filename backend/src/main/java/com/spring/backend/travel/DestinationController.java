package com.spring.backend.travel;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class DestinationController {
    private final DestinationService destinationService;

    @GetMapping
    List<Destination> getAll(){
        return destinationService.getAllDestination();
    }
    @PostMapping
    Destination add(@RequestBody DestinationCreate request){
        return destinationService.addDestination(request);
    }
}
