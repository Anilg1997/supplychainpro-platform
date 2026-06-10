package com.supplychainpro.portal.repository;

import com.supplychainpro.portal.model.PortalDocument;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface PortalDocumentRepository extends JpaRepository<PortalDocument, UUID> {
}
