package net.fiveleaves.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class SystemLogAdvice {
	
	// Service, Controller Before Log
	@Before("execution(* net.fiveleaves.service.*.*(..)) || execution(* net.fiveleaves.controller.*.*(..))")
	public void logBefore(JoinPoint joinPoint) {
		String className = joinPoint.getTarget().getClass().getSimpleName();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		log.info("Called method: " + className + "." + methodName);
	}
	
	// Service Throwing
	@AfterThrowing(pointcut = "execution(* net.fiveleaves.service.*.*(..))", throwing="exception")
	public void logException(Exception exception) {
		log.error("@AfterThrowing Error: " + exception.getMessage());
	}
}
