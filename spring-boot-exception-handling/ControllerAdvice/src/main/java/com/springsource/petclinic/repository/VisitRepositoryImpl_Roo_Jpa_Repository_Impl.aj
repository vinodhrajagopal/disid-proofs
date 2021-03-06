// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.repository;

import com.mysema.query.BooleanBuilder;
import com.mysema.query.jpa.JPQLQuery;
import com.mysema.query.types.Order;
import com.mysema.query.types.OrderSpecifier;
import com.mysema.query.types.path.NumberPath;
import com.springsource.petclinic.domain.Pet;
import com.springsource.petclinic.domain.QVisit;
import com.springsource.petclinic.domain.Vet;
import com.springsource.petclinic.domain.Visit;
import com.springsource.petclinic.repository.GlobalSearch;
import com.springsource.petclinic.repository.VisitRepositoryCustom;
import com.springsource.petclinic.repository.VisitRepositoryImpl;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VisitRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare parents: VisitRepositoryImpl implements VisitRepositoryCustom;
    
    declare @type: VisitRepositoryImpl: @Transactional(readOnly = true);
    
    public Page<Visit> VisitRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idVisit = new NumberPath<Long>(Long.class, "id");
        QVisit visit = QVisit.visit;
        JPQLQuery query = getQueryFrom(visit);
        BooleanBuilder where = new BooleanBuilder();

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                visit.description.containsIgnoreCase(txt)
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "description":
                           query.orderBy(new OrderSpecifier<String>(direction, visit.description));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idVisit.asc());
        
        List<Visit> results = query.list(visit);
        return new PageImpl<Visit>(results, pageable, totalFound);
    }
    
    public Page<Visit> VisitRepositoryImpl.findAllByVet(Vet vetField, GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idVisit = new NumberPath<Long>(Long.class, "id");
        QVisit visit = QVisit.visit;
        JPQLQuery query = getQueryFrom(visit);
        BooleanBuilder where = new BooleanBuilder(visit.vet.eq(vetField));

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                visit.description.containsIgnoreCase(txt)
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "description":
                           query.orderBy(new OrderSpecifier<String>(direction, visit.description));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idVisit.asc());
        
        List<Visit> results = query.list(visit);
        return new PageImpl<Visit>(results, pageable, totalFound);
    }
    
    public Page<Visit> VisitRepositoryImpl.findAllByPet(Pet petField, GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idVisit = new NumberPath<Long>(Long.class, "id");
        QVisit visit = QVisit.visit;
        JPQLQuery query = getQueryFrom(visit);
        BooleanBuilder where = new BooleanBuilder(visit.pet.eq(petField));

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                visit.description.containsIgnoreCase(txt)
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "description":
                           query.orderBy(new OrderSpecifier<String>(direction, visit.description));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idVisit.asc());
        
        List<Visit> results = query.list(visit);
        return new PageImpl<Visit>(results, pageable, totalFound);
    }
    
}
