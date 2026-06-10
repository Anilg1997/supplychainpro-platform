package com.supplychainpro.planning.repository;

import com.supplychainpro.planning.model.SupplyPlan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface SupplyPlanRepository extends JpaRepository<SupplyPlan, UUID> {
}
