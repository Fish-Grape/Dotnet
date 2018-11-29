using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using UniversityTutorManageSys.Data;
using UniversityTutorManageSys.Models;

namespace UniversityTutorManageSys.Controllers
{
    public class TaskwakeManageController : BaseController
    {
        private readonly DataContext _context;

        public TaskwakeManageController(DataContext context)
        {
            _context = context;
        }

        // GET: TaskwakeManage
        public async Task<IActionResult> TaskwakeDetail()
        {
            return View(await _context.MyTaskwake.ToListAsync());
        }

        // GET: TaskwakeManage/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var myTaskwake = await _context.MyTaskwake
                .FirstOrDefaultAsync(m => m.MyTaskwakeGUID == id);
            if (myTaskwake == null)
            {
                return NotFound();
            }

            return View(myTaskwake);
        }

        // GET: TaskwakeManage/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: TaskwakeManage/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MyTaskwakeGUID,TaskwakeDetail")] MyTaskwake myTaskwake)
        {
            if (ModelState.IsValid)
            {
                myTaskwake.MyTaskwakeGUID = Guid.NewGuid();
                _context.Add(myTaskwake);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(TaskwakeDetail));
            }
            return View(myTaskwake);
        }

        // GET: TaskwakeManage/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var myTaskwake = await _context.MyTaskwake.FindAsync(id);
            if (myTaskwake == null)
            {
                return NotFound();
            }
            return View(myTaskwake);
        }

        // POST: TaskwakeManage/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("MyTaskwakeGUID,TaskwakeDetail")] MyTaskwake myTaskwake)
        {
            if (id != myTaskwake.MyTaskwakeGUID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(myTaskwake);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MyTaskwakeExists(myTaskwake.MyTaskwakeGUID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(TaskwakeDetail));
            }
            return View(myTaskwake);
        }

        // GET: TaskwakeManage/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var myTaskwake = await _context.MyTaskwake
                .FirstOrDefaultAsync(m => m.MyTaskwakeGUID == id);
            if (myTaskwake == null)
            {
                return NotFound();
            }

            return View(myTaskwake);
        }

        // POST: TaskwakeManage/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            var myTaskwake = await _context.MyTaskwake.FindAsync(id);
            _context.MyTaskwake.Remove(myTaskwake);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(TaskwakeDetail));
        }

        private bool MyTaskwakeExists(Guid id)
        {
            return _context.MyTaskwake.Any(e => e.MyTaskwakeGUID == id);
        }
    }
}
