package com.supplychainpro.pr.repository;

import com.supplychainpro.pr.model.RequisitionItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface RequisitionItemRepository extends JpaRepository<RequisitionItem, UUID> {
}
