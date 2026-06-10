package com.supplychainpro.warehouse.repository;

import com.supplychainpro.warehouse.model.BinLocation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface BinLocationRepository extends JpaRepository<BinLocation, UUID> {
}
