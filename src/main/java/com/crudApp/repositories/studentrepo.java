package com.crudApp.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.crudApp.Entitities.Student;
@Repository
public interface studentrepo extends JpaRepository<Student, Integer> {
	
	@Modifying
	@Transactional
	@Query(value="insert into student(s_age,s_class,s_email,s_favourite_subject,s_gender,s_name) values(?,?,?,?,?,?)",nativeQuery = true)
	public void saveStudent(@Param("s_age") int s_age,@Param("s_class") String s_class,@Param("s_email") String s_email,@Param("s_favourite_subject") String s_favourite_subject,@Param("s_gender") String s_gender,@Param("s_name") String s_name);
	@Query(value="select * from student",nativeQuery = true)
	public List<Student> getAll();
	@Query(value="select * from student where s_id =?",nativeQuery = true)
	public Student getStudentById(@Param("s_id")int id);
	@Modifying
	@Transactional
	@Query(value="delete from student where s_id =?",nativeQuery = true)
	public void deleteStudent(@Param("s_id") int id);
	@Modifying
	@Transactional
	@Query(value="UPDATE `student` SET `s_age`=?,`s_class`=?,`s_email`=?,`s_favourite_subject`=?,`s_name`=? WHERE s_id =1",nativeQuery = true)
	public int updateStudent(@Param("s_id") int id,@Param("s_age") int s_age,@Param("s_class") String s_class,@Param("s_email") String s_email,@Param("s_favourite_subject") String s_favourite_subject,@Param("s_name") String s_name);
}
