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
        public void IndexTest_ValidStoreName_ReturnStoreIndexView()
        {
            //Arrange
            string storeName = "TestUser1";
            StoreController sc = new StoreController();

            //Act
            ViewResult actualResult = sc.Index(storeName) as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            string expectedViewName = "Index";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        //Business logic on the index method is incorrect ECEC
        [TestMethod()]
        public void IndexTest_InvalidStoreName_ReturnHomeIndexView()
        {
            //Arrange
            string storeName = "bidvnlkvkln";
            StoreController sc = new StoreController();

            //Act
            ViewResult actualResult = sc.Index(storeName) as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            /* Thought this looks similar to the original test case, this should actually return
             * the index of the home controller, not the store
             */
            string expectedViewName = "Index";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        [TestMethod()]
        public void RandomStoreTest_ReturnStoreIndexView()
        {
            //Arrange
            StoreController sc = new StoreController();

            //Act
            ViewResult actualResult = sc.RandomStore() as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            string expectedViewName = "Index";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        //This test needs to be revisted. How do you inject a count > 1000? ECEC
        [TestMethod()]
        public void RandomStoreTest_ReturnHomeIndexView()
        {
            //Arrange
            StoreController sc = new StoreController();

            //Act
            ViewResult actualResult = sc.RandomStore() as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            string expectedViewName = "Index";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        [TestMethod()]
        public void StoreInventoryTest_UserNotAuthenticated_ReturnAccountLogin()
        {
            //Arrange
            StoreController sc = new StoreController();

            //Act
            ViewResult actualResult = sc.StoreInventory() as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            string expectedViewName = "Login";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        //This will need some work after I figure out how to fake User.Identity ECEC
        [TestMethod()]
        public void StoreInventoryTest_UserAuthenticated_ReturnStoreInventory()
        {
            //Arrange
            StoreController sc = new StoreController();
            //Fake User.Identity

            //Act
            ViewResult actualResult = sc.StoreInventory() as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            string expectedViewName = "StoreInventory";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        //Need to return to this after I figure out ModelState faking ECEC
        [TestMethod]
        public void StoreInventoryTest_ModelStateValid_AddItem()
        {
            //Arrange
            StoreController sc = new StoreController();
            //Fake User.Identity
            //Fake ModelState

            //Act
            //Add fake item to sc.StoreInventory() call
            ViewResult actualResult = sc.StoreInventory() as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            string expectedViewName = "StoreInventory";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        //Need to return to this after I figure out ModelState faking ECEC
        [TestMethod]
        public void StoreInventoryTest_ModelStateInvalid_ReturnStoreInventory()
        {
            //Arrange
            StoreController sc = new StoreController();
            //Fake User.Identity
            //Fake Invalid ModelState

            //Act
            //Add fake item to sc.StoreInventory() call
            ViewResult actualResult = sc.StoreInventory() as ViewResult;
            string actualViewName = actualResult.ViewName;

            //Assert
            string expectedViewName = "StoreInventory";
            Assert.AreEqual(expectedViewName, actualViewName);
        }

        [TestMethod()]
        public void UpdateItemTest_ModelStateValid_ReturnStoreInventory()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void UpdateItemTest_ModelStateInvalid_ReturnStoreInventory()
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