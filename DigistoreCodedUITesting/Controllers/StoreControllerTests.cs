using System;
using System.Net;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DigiStoreWithMVC.Controllers;
using DigiStoreWithMVC.Models;




namespace DigiStoreWithMVC.Controllers.Tests
{
    [TestClass()]
    public class StoreControllerTests
    {
        [TestMethod()]
        public void IndexTest_ValidStoreName_ReturnValidStoreIndex()
        {
            string storeName = "TestUser1";
            StoreController sc = new StoreController();
            ViewResult actualResult = sc.Index(storeName) as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            string expectedViewName = "Index";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        
        public void IndexTest_InvalidStoreName_ReturnSomething()
        {
            string storeName = "TestUser1";
            StoreController sc = new StoreController();
            ViewResult actualResult = sc.Index(storeName) as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            string expectedViewName = "Index";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        [TestMethod()]
        public void RandomStoreTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void StoreInventoryTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void StoreInventoryTest1()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void UpdateItemTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void DeleteItemTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void ShoppingCartTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void EditStoreInfoTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void EditStoreHoursTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void AddToCartTest()
        {
            Assert.Fail();
        }
    }
}