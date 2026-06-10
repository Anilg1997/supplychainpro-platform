package com.supplychainpro.rfq.repository;

import com.supplychainpro.rfq.model.RFQResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface RFQResponseRepository extends JpaRepository<RFQResponse, UUID> {
}
