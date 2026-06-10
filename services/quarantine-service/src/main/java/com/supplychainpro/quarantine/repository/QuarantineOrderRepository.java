package com.supplychainpro.quarantine.repository;

import com.supplychainpro.quarantine.model.QuarantineOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface QuarantineOrderRepository extends JpaRepository<QuarantineOrder, UUID> {
}
