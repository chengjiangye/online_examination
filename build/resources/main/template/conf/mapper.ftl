<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${model?lower_case}">
    <select id="list" resultType="${model?lower_case}">
        SELECT *
        FROM ${db}.${table}
        ORDER BY id
    </select>
    <select id="queryById" resultType="${model?lower_case}">
        SELECT *
        FROM ${db}.${table}
        WHERE id = ${'#'}{id}
    </select>
    <update id="modify">
        UPDATE ${db}.${table}
        SET
        <#list columns?keys as key>
            ${key} = ${'#'}{${columns[key]}}<#if key_has_next>, </#if>
        </#list>
        WHERE id = ${'#'}{id}
    </update>
    <delete id="remove">
        DELETE FROM ${db}.${table}
        WHERE id = ${'#'}{id}
    </delete>
    <insert id="create" parameterType="${model?lower_case}" useGeneratedKeys="true" keyProperty="id">
        INSERT INTO ${db}.${table} (
        <#list columns?keys as key>
            ${key}<#if key_has_next>, </#if>
        </#list>
        )
        VALUES (
        <#list columns?keys as key>
            ${'#'}{${columns[key]}}<#if key_has_next>, </#if>
        </#list>
        );
    </insert>
</mapper>