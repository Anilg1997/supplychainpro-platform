package com.supplychainpro.cost.repository;

import com.supplychainpro.cost.model.CostEntry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface CostEntryRepository extends JpaRepository<CostEntry, UUID> {
}
