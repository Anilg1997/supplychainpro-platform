package com.supplychainpro.rfq.repository;

import com.supplychainpro.rfq.model.RFQ;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface RFQRepository extends JpaRepository<RFQ, UUID> {
}
