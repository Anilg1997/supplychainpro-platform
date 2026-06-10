package com.supplychainpro.inventory.controller;

import com.supplychainpro.inventory.model.StockMovement;
import com.supplychainpro.inventory.repository.StockMovementRepository;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/stock-movements")
public class StockMovementController {

    private final StockMovementRepository repository;

    public StockMovementController(StockMovementRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public ResponseEntity<List<StockMovement>> findAll() {
        return ResponseEntity.ok(repository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<StockMovement> findById(@PathVariable UUID id) {
        return ResponseEntity.ok(repository.findById(id)
                .orElseThrow(() -> new RuntimeException("StockMovement not found: " + id)));
    }

    @PostMapping
    public ResponseEntity<StockMovement> create(@RequestBody StockMovement entity) {
        return ResponseEntity.ok(repository.save(entity));
    }

    @PutMapping("/{id}")
    public ResponseEntity<StockMovement> update(@PathVariable UUID id, @RequestBody StockMovement entity) {
        entity.setId(id);
        return ResponseEntity.ok(repository.save(entity));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        repository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
