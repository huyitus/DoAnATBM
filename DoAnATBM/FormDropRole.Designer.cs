﻿using System;
using System.Windows.Forms;

namespace DoAnATBM
{
    partial class FormDropRole
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.textName = new System.Windows.Forms.TextBox();
            this.buttonDropRole = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(53, 29);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Role Name:";
            // 
            // textName
            // 
            this.textName.Location = new System.Drawing.Point(165, 26);
            this.textName.Name = "textName";
            this.textName.Size = new System.Drawing.Size(154, 22);
            this.textName.TabIndex = 5;
            // 
            // buttonDropRole
            // 
            this.buttonDropRole.Location = new System.Drawing.Point(126, 66);
            this.buttonDropRole.Name = "buttonDropRole";
            this.buttonDropRole.Size = new System.Drawing.Size(87, 32);
            this.buttonDropRole.TabIndex = 0;
            this.buttonDropRole.Text = "Xóa";
            this.buttonDropRole.Click += new System.EventHandler(this.buttonDropRole_Click);
            // 
            // FormDropRole
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(362, 124);
            this.Controls.Add(this.buttonDropRole);
            this.Controls.Add(this.textName);
            this.Controls.Add(this.label1);
            this.Name = "FormDropRole";
            this.Text = "FormDropRole";
            this.Load += new System.EventHandler(this.FormDropRole_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textName;
        private System.Windows.Forms.Button buttonDropRole;

        #endregion
    }
}